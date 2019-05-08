# calibre

Web desktop docker image for: Calibre

# Usage

See `run.sh` and `calibre.sh` for examples on how to run the application.

# Volumes

| Volume path          | Description                                             |
| :--------------------| :-------------------------------------------------------|
| `/calibre-library`   | the calibre-library where calibre will store its e-books|
| `/calibre-autoscan`  | folder that will be auto scanned by calibre. Files in this folder will also be auto deleted after the auto import. |
| `/nobody/inbox`      | shared folder where you can place e-books you can import at your leisure |

# Exposed Ports

| Port number          | Description                                             |
| :--------------------| :-------------------------------------------------------|
| `7777`               | the web interface of of calibre runs here               |
| `32000`              | the application runs here                               |


# Base image configurable settings

Lots of things can be configured through the base image.

See repo [docker-web-gui-base](https://github.com/IvoNet/docker-web-gui-base/blob/master/README.md)
for documentation on the base image.

# For developers

## Build 

see `build.sh` for build instructions


---
# License

    Copyright 2019 (c) Ivo Woltring

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
