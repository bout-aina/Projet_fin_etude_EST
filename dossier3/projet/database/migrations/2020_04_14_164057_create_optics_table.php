<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateOpticsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('optics', function (Blueprint $table) {
            $table->increments('idOptic');
            $table->bigInteger('idRDV')->unsigned()->nullable();
            $table->float('leftSphere');
            $table->float('leftCylindre');
            $table->float('leftAxe');
            $table->float('leftAdd');
            $table->float('rightSphere');
            $table->float('rightCylindre');
            $table->float('rightAxe');
            $table->float('rightAdd');

            $table->foreign('idRDV')
            ->references('idRendezVous')
            ->on('rendezvouses');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('optics');
    }
}
