## Overview

The Corkboard API is a Ruby on Rails back-end for the front-end React app,
Corkboard that lets users chat and share resources on subjects in a bulletin
board format. View here: https://github.com/nickpaolino/corkboard. The Corkboard
API is a JSON API that uses Postgres for its database. It manages data for user
auth, boards, messages, resources, and records the placement of notes on the
bulletin board. Action Cable is used to create web sockets for a real-time chat
on each board.

## Database Structure

This Rails back-end is deployed through Heroku and the front-end interacts with
it through get, post, patch, and destroy requests.

The database schema is as follows:

* Users
* Boards
* Board Users
* Messages
* Media

Users, boards, board users, messages, and media all have their own unique routes
to facilitate API calls.

## Web Sockets

Web sockets are implemented through Action Cable to create a real-time chat
between users on each board. Every board has it's own channel that is subscribed
to by each user every time the board show page is loaded. When subscribing to a
channel, the front-end React app receives every message broadcasted to that
channel in real-time. When a user navigates to another page, React unsubscribes
from that specific Action Cable channel.

## User Authentication

User authentication is implemented through the use of a sessions controller.
When a user logs in, a new session is created. When the user is validated upon
sign up or login, the sessions controller sends back a response with the user
data (id and username) and a JWT token. This JWT token is stored in the
browser's local storage and is used to authenticate the user on refresh.
