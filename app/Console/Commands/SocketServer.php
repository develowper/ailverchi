<?php

namespace App\Console\Commands;

use App\Http\Helpers\Telegram;
use Illuminate\Console\Command;
use Illuminate\Support\Facades\Artisan;

class SocketServer extends Command
{
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
    protected $description = 'php artisan reverb:start --host="127.0.0.1" --port=1126 --hostname="ailverchi.ae"';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        $res= Artisan::call("reverb:start",["--host" => "127.0.0.1",]);
         Telegram::sendMessage(Telegram::LOGS[0],print_r($res,true));
    }
}
