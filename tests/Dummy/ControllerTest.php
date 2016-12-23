<?php

class ControllerTest extends \PHPUnit_Framework_TestCase
{
    public function testControllerConstructor()
    {
        $ml        = $this->createMock('\Monolog\Logger', array(), array(), '', false);

        $msettings = array();
        
        $obj = new \Dummy\Controller\IndexController($ml, $msettings);
        $this->assertInstanceOf('\Dummy\Controller\IndexController', $obj);
    }
}
