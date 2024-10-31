<?php

namespace App\Console;

use App\Console\Commands\SocketServer;
use Illuminate\Console\Scheduling\Schedule;
use Illuminate\Foundation\Console\Kernel as ConsoleKernel;

class Kernel extends ConsoleKernel
{
    /**
     * Define the application's command schedule.
     *
     * @param \Illuminate\Console\Scheduling\Schedule $schedule
     * @return void
     */
    protected function schedule(Schedule $schedule)
    {
//        $schedule->call(function () {
//
//            SocketServer::sendMessage(SocketServer::LOGS[0], 'start');
//        })->everyMinute();
//        $schedule->command('socket:serve')->everyMinute();
        Schedule::exec('/usr/local/bin/php /home/allveerchi/ailverchi/artisan reverb:start --host="127.0.0.1" --port=1126 --hostname="ailverchi.ae"')->everyMinute();

    }

    /**
     * Register the commands for the application.
     *
     * @return void
     */
    protected function commands()
    {
        $this->load(__DIR__ . '/Commands');

        require base_path('routes/console.php');
    }
}
