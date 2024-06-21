<?php

namespace Agribilis\Console\Commands;

use Agribilis\Models\Product;
use Illuminate\Console\Command;
use Elastic\Elasticsearch\ClientBuilder;


class IndexProducts extends Command
{
    protected $signature = 'index:products';
    protected $description = 'Index Products into Elasticsearch';

    public function __construct()
    {
        parent::__construct();
    }

    public function handle()
    {
        $client = ClientBuilder::create()->setHosts(config('database.connections.elasticsearch.hosts'))->build();

        // Delete existing index if needed
        // $client->indices()->delete(['index' => 'products']);

        // Create a new index with mapping
        $client->indices()->create([
            'index' => 'products',
            'body' => [
                'mappings' => [
                    'properties' => [
                        'name' => ['type' => 'text'],
                        'description' => ['type' => 'text'],
                        // Add more fields as needed
                    ],
                ],
            ],
        ]);

        // Index products data
        $products = Product::all();

        foreach ($products as $product) {
            $params = [
                'index' => 'products',
                'id' => $product->id,
                'body' => [
                    'name' => $product->name,
                    'description' => $product->description,
                    // Map other fields here
                ],
            ];

            $client->index($params);
        }

        $this->info('Products indexed successfully.');
    }
}
