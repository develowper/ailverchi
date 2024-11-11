<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Inertia\Inertia;

class DocumentController extends Controller
{

    public function view(Request $request, $name)
    {
        $path = Storage::path('public/docs');

        $matchingFiles = \Illuminate\Support\Facades\File::glob("{$path}/$name");
        $exists = count($matchingFiles) > 0;
        $doc = (object)[
            'title' => $exists ? $name : __('item_not_found'),
            'url' => $exists ? route('storage.docs') . "/$name" : null
        ];
        return Inertia::render('Document/View', [
            'doc' => $doc,
        ]);

    }
}
