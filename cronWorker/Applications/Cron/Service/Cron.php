<?php

/**
 * 任务执行
 *
 * @author: moxiaobai
 * @since : 2016/4/11 17:37
 */

use \Workerman\Lib\Timer;

require_once APP_PATH . '/Library/Curl.php';
require_once APP_PATH . '/Library/Config.php';

class Cron {

    /**
     * 执行任务
     * @param $data
     */
    public static function execute($data) {
        $taskId       = $data['c_id'];            //任务ID
        $type         = $data['c_type'];          //任务类型
        $content      = $data['c_content'];       //任务Url
        $starTime     = $data['c_start_time'];    //任务开始执行时间
        $endTime      = $data['c_end_time'];      //任务结束时间
        $executeTime  = $data['c_execute_time'];  //程序执行时间， persistent为2，3有用
        $crontabExpression   = $data['c_crontab_expression'];    //linux crontab 表达式
        $persistent   = $data['c_persistent'];    //程序执行类型
        $uid          = $data['d_id'];            //程序负责人
        $alarmNumber  = $data['c_alarm'];         //每天报警次数

        $now = time();
        if($now >= $starTime && $now < $endTime) {
            //到了执行时间才执行（针对每天执行一次，只执行一次任务）
            //每天指定时间执行一次
            if($persistent == 2) {
                if(date('H:i') != date('H:i', $executeTime)) {
                    return true;
                }
            }

            //只执行一次
            if($persistent == 3) {
                if(date('Y-m-d H:i') != date('Y-m-d H:i', $executeTime) ) {
                    return true;
                }
            }
            // linux crontab task, check 时间.
            if ($persistent == 4) {
                try {
                    $seconds = \ParseCrontab\Crontab::parse($crontabExpression, 0);
                    $currsec = date("s");
                    if (empty($seconds) || !in_array($currsec, array_keys($seconds))) {
                        echo "crontab express: {$crontabExpression} | now : ".date("Y-m-d H:i:s")." filter \n";
                        return true;
                    }
                } catch(\Exception $e) {
                    return true;
                }
            }

            $status = 1;
            $time_start       = self::executionTime();
            $memory_start     = memory_get_usage();
            switch($type) {
                case 1:
                    //curl
                    $responseResult = Curl::get($content);
                    $result         = $responseResult['result'];
                    $httpCode       = $responseResult['code'];
                    $msg            = $responseResult['msg'];

                    if(!is_null($msg) || $httpCode != 200) {
                        $status = 2; //状态为2表示失败
                        $result = $msg;
                    }

                    if(is_null(json_decode($result, true))) {
                        $status = 2; //状态为2表示失败
                    }

                    break;
                case 2:
                    //php yaf cli
                    $cliIni    = Config::get('application', "yafCli");
                    $directory = $cliIni['directory'];

                    $file   = "{$directory}request.php";
                    exec("php {$file} request_uri='{$content}' 2>&1", $ret);

                    $result = $ret[0];
                    if(is_null(json_decode($result, true))) {
                        $status = 2; //状态为2表示失败
                    }

                    break;
                case 3:
                    //php cli
                    $cliIni    = Config::get('application', "phpCli");
                    $directory = $cliIni['directory'];

                    $file   = "{$directory}$content";
                    exec("php {$file} 2>&1", $ret);

                    $result = $ret[0];
                    if(is_null(json_decode($result, true))) {
                        $status = 2; //状态为2表示失败
                    }

                    break;
                default:
                    break;
            }
            $time_end         = self::executionTime();
            $memory_end       = memory_get_usage();

            //消耗时间
            $consumeTime   = $time_end - $time_start;
            //消耗内存
            $consumeMemory = $memory_end - $memory_start;

            //报警处理  当天报警次数
            if($status == 2) {
                $alarm = new Alarm();
                $alarm->noticeProgrammer($uid, $data, $alarmNumber);
            }

            //记录定时任务执行日志
            $log = array(
                'c_id'              => $taskId,
                'cl_result'         => $result,
                'cl_status'         => $status,
                'cl_consume_time'   => $consumeTime,
                'cl_consume_memory' => $consumeMemory,
                'cl_datetime'       => time()
            );
            self::addTimerLog($log);
        } elseif ($now > $endTime) {
            //任务结束，删除定时程序

            //删除定时器
            Timer::del($data['c_timer_id']);

            //删除任务
            $task   = new Task();
            $task->delTask($taskId);

        }
    }

    /**
     * 计算程序执行时间
     *
     * @return float
     */
    public static function executionTime() {
        list($usec, $sec) = explode(" ", microtime());
        return ((float)$usec + (float)$sec);
    }


    /**
     * 定时器运行日志
     *
     * @param $data
     */
    public static function addTimerLog($data) {
        $db = Mysql::instance('cron');

        $suffix = self::getDbSuf($data['c_id'], 36);
        $table  = "t_cron_log_{$suffix}";

        return $db->insert($table)->rows($data)->execute();
    }

    /**
     * 获取分表标识
     * @param 用户ID
     * @return 表后缀
     */
    public static function getDbSuf($id,$num=36){
        switch($num){
            case 10:$arrsuf = array('0','1','2','3','4','5','6','7','8','9');break;
            case 26:$arrsuf = array('A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z');break;
            case 36:$arrsuf = array('0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z');break;
            default:throw new Exception('error num',100000);
        }
        $str = md5($id);
        $idx = (ord($str[0]) + ord($str[1]) + ord($str[2])) % $num;

        return $arrsuf[$idx];
    }
}