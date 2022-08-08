<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateDossiermedicalesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('dossiermedicales', function (Blueprint $table) {
            $table->increments('iddossier');
            $table->bigInteger('idpatient')->unsigned()->nullable();
            $table->binary('data');
           
            $table->foreign('idpatient')
                ->references('id')
                ->on('users');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('dossiermedicales');
    }
}
