# calibre

Web desktop application for Calibre ebook application

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

## Base image variables

These variables should be defined by yourself at startup or in your `Dockerfile` during the build
to make the application look good and give yourself some control over the working. 

| Variable name            | Description  | Default |
| :----------------------- | :----------- | :------ |
| APPNAME                  | the name of the guacamole connection | `DESKTOP_APPLICATION` of you have your own image but did not define a name and `eyes` if you are just testing the base image |
| GUACAMOLE_ADMIN_USERNAME | the guacamole admin username if you log in with this user you can configure everything | `guacadmin` |
| GUACAMOLE_ADMIN_PASSWORD | the guacamole admin password | `guacadmin` |
| GUACAMOLE_USER_NAME      | a guacamole limited user with only access to the defined application | `guest` |
| GUACAMOLE_USER_PASSWORD  | the password for the limited user | `secret` |

## Base image - advanced variables

Most of the time these variables do not need to be changed often unless you want to :-)

| Variable name            | Description  | Default |
| :----------------------- | :----------- | :------ |
| WIDTH                    | the width of the screen displayed in the browser | `1920` |
| HEIGHT                   | the height of the screen displayed in the browser | `1080` |
| VNC_DEPTH                | specify the pixel depth in bits of the vnc desktop to be created. Options are 8, 15, 16 and 24. [doc](https://tigervnc.org/doc/Xvnc.html) | `24` |
| VNC_DPI                  | the dots per inc for the vnc desktop | `96` |
| USER_ID                  | the userid for the nobody user  | `99` |
| GROUP_ID                 | the groupid for the nobody user | `100`|
| DISPLAY                  | the display number used by openbox. This value probably does not need to be changed ever unless you get the following error message during startup `Openbox-Message: Failed to open the display from the DISPLAY environment variable.` then you might want to change it to `:0` or some such | `:1` |
| SERVER_PORT              | the port on which tomcat (guacamole-client) will run. Note that if you overrule this you also overrule the exposed internal port. | `32000` |


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
