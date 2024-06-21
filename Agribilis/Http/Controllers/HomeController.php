<?php

namespace Agribilis\Http\Controllers;

use Agribilis\Models\Category;
use Elastic\Elasticsearch\ClientBuilder;
use Illuminate\Http\Request;
use GuzzleHttp\Client as HttpClient;

class HomeController extends Controller
{
    public function index()
    {
        // $client = ClientBuilder::create()->setHosts(['localhost:9200'])->build();
        // try {
        //     $result = $client->info();
        //     var_dump($result);
        // } catch (\Throwable $th) {
        //     var_dump($th->getMessage());
        // }

        // return false;


        return view('welcome');
    }
}
