<?php

namespace Database\Factories;

use Faker\Generator;
use Illuminate\Database\Eloquent\Factories\Factory as BaseFactory;

/**
 * @template TModel of \Illuminate\Database\Eloquent\Model
 *
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<TModel>
 */
abstract class Factory extends BaseFactory
{
    /**
     * Get a new Faker instance.
     */
    protected function withFaker(): Generator
    {
        $faker = parent::withFaker();
        $faker->seed(1234);

        return $faker;
    }
}
