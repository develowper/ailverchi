<?php

namespace App\Http\Helpers;

use ElephantIO\Client as ElephantIOClient;

class SocketHelper
{
    public $client, $options;


    public function __construct()
    {
        $this->options = ['client' => ElephantIOClient::CLIENT_4X];
        $this->client = ElephantIOClient::create(env('REVERB_SERVER_HOST'), $this->options);
        $this->client->connect();
        $this->client->of('/'); // can be omitted if connecting to default namespace
    }

    public function emit($eventName, $eventData)
    {
        $this->client->emit($eventName, $eventData);
        $this->client->disconnect();
    }

}
