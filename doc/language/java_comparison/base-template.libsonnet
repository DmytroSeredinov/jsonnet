/*
Copyright 2016 Google Inc. All rights reserved.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

{
    // Mandatory param
    accessToken:: error "accessToken must be defined",

    // Optional params
    image:: "gcr.io/cooltool-1009/pipeline_image:latest",
    extraEnv:: [],

    apiVersion: "v1",
    kind: "ReplicationController",
    spec: {
        replicas: 1,
        spec: {
            containers: [
                {
                    env: [
                        {
                            name: "ACCESSTOKEN",
                            value: $.accessToken,
                        },
                    ] + $.extraEnv,
                    image: $.image,
                    name: "twitter-to-redis",
                },
            ],
        },
    },
}
