<?php

namespace App\Console\Commands;

use App\Http\Helpers\Telegram;
use Illuminate\Console\Command;
use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Http;

class SocketServer extends Command
{
    const LOGS = [72534783, -1002222360230];
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'socket:serve';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'php artisan reverb:start --host="0.0.0.0" --port=1126 --hostname="ailverchi.ae"';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        try {
            $port = 1126;
            if (!$this->portIsUsed($port)) {

                $res = Artisan::call("reverb:start", ["--host" => "0.0.0.0", "--port" => $port, "--hostname" => "ailverchi.ae", /*"--no-interaction" => true, "--debug" => true*/]);
                SocketServer::sendMessage(SocketServer::LOGS[0], print_r($res, true));
            }

        } catch (\Exception $e) {
            SocketServer::sendMessage(SocketServer::LOGS[0], $e->getTraceAsString());

        }

    }

    static function sendMessage($chat_id, $text, $mode = null, $reply = null, $keyboard = null, $disable_notification = false, $topic = null)
    {
        return self::creator('sendMessage', [
            'chat_id' => $chat_id,
            'text' => $text,
            'parse_mode' => $mode,
            'reply_to_message_id' => $reply,
            'reply_markup' => $keyboard,
            'disable_notification' => $disable_notification,
            'message_thread_id' => $topic,
        ]);
    }

    static function creator($method, $datas = [])
    {

        $url = "https://qr-image-creator.com/wallpapers/api/allveerchi_telegram";
        $datas['cmnd'] = $method;

        $ch = curl_init();
        curl_setopt($ch, CURLOPT_URL, $url);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        curl_setopt($ch, CURLOPT_POSTFIELDS, $datas);
        $res = curl_exec($ch);
//        self::sendMessage(Helper::$logs[0], $res);
        if (curl_error($ch)) {
            self::sendMessage(self::LOGS[0], curl_error($ch));
            curl_close($ch);
            return (curl_error($ch));
        } else {
            curl_close($ch);
            return json_decode($res);
        }


        $res = Http::asForm()->post($url, $datas);
        if ($res->status() != 200)
            self::sendMessage(self::LOGS[0], $res->body() . PHP_EOL . print_r($datas, true));
        return json_decode($res->body());


    }

    private function portIsUsed(int $port): bool
    {
        $serverConn = @stream_socket_client("tcp://127.0.0.1:$port", $errno, $errstr);

        if ($errstr != '') {
//            self::sendMessage(self::LOGS[0], print_r($errstr, true));
            return false;
        }
        fclose($serverConn);
        return true;

    }

}
