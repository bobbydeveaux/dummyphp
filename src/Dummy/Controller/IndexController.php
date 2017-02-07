<?php

namespace Dummy\Controller;

use Psr\Log\LoggerInterface;
use Psr\Http\Message\ServerRequestInterface as Request;
use Psr\Http\Message\ResponseInterface as Response;

use Firebase\JWT\JWT;

final class IndexController
{
    /**
     * Logger
     */
    protected $logger;

    /**
     * Handles the HTTP GET.
     *
     * @param LoggerInterface $logger The app.
     *
     */
    public function __construct(
        LoggerInterface $logger,
        $settings
    ) {
        $this->logger   = $logger;
        $this->settings = $settings;
    }

    /**
     * Handles the HTTP GET.
     *
     * @param Request  $request  The request.
     * @param Response $response The Response.
     * @param Variadic $args     Arguments
     *
     */
    public function indexAction(Request $request, Response $response, $args)
    {


        $data = [
            'message' => 'Dummy App Working! This text will feature in Docker 1.13 (CoreOS Alpha!!)',
            'hostname' => $_SERVER['HOSTNAME']
        ];

        return $response->withStatus(200)
				        ->withHeader("Content-Type", "application/json")
				        ->write(json_encode($data, JSON_UNESCAPED_SLASHES));
    }

}