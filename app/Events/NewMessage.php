<?php

namespace App\Events;

use App\Http\Helpers\SocketHelper;
use Illuminate\Broadcasting\Channel;
use Illuminate\Broadcasting\InteractsWithSockets;
use Illuminate\Broadcasting\PresenceChannel;
use Illuminate\Broadcasting\PrivateChannel;
use Illuminate\Contracts\Broadcasting\ShouldBroadcast;
use Illuminate\Foundation\Events\Dispatchable;
use Illuminate\Queue\SerializesModels;

class NewMessage implements ShouldBroadcast
{
    use Dispatchable, InteractsWithSockets, SerializesModels;

    public $message;

    /**
     * Create a new event instance.
     */
    public function __construct($arg)
    {
        $this->message = $arg ?? 'no message';
    }

    /**
     * Get the channels the event should broadcast on.
     *
     * @return array<int, \Illuminate\Broadcasting\Channel>
     */
    public function broadcastOn(): array
    {
        return [
            new   Channel('room')
        ];
    }

//    public function broadcastAs() //event on channel
//    {
////        if active, need . before name in listen
//        return 'NewMessage';
//    }

    public function broadcastWith() //attributes in payload event
    {
        $data = ['message' => $this->message];

        (new SocketHelper())->emit('NewMessage', $data);

        return $data;
    }
}
