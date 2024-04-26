# Firefish - TravelApp

This app can be used to plan for travels by building an itinerary. Firefish students will practice everything learned from previous classes, and go beyond by integrating with a third-party API.

## CI statuses

| `main` | `dev-main` |
| ------ | ---------- |
| ![CI badge for main](https://github.com/Code-the-Dream-School/firefish-practicum/actions/workflows/ci.yml/badge.svg?branch=main) | ![CI badge for dev-main](https://github.com/Code-the-Dream-School/firefish-practicum/actions/workflows/ci.yml/badge.svg?branch=dev-main) |

## Kanban Board

https://github.com/orgs/Code-the-Dream-School/projects/39/views/1

## Updated MVP

https://docs.google.com/document/d/11x6IiLobgSv9nSVWiJgmuIsjhN1IFt5iNeCNvN7XNz0/edit

## Team Drive

https://drive.google.com/drive/u/2/home

## Schema

https://docs.google.com/presentation/d/19QPaftbS53T1aDwoWH2HPmx9mRD4EUKEzHbJKBwfpOs/edit#slide=id.g2c78055cd7f_0_172

Please @Ron in our Slack channel if unclear

## Setting Up Your Environment

Clone the repo:

    git clone https://github.com/Code-the-Dream-School/firefish-practicum.git

Create a dev-main branch:

    git checkout -b dev-main origin/dev-main

## Creating your Dotenv file

1. In your root directory, create a new file named ".env"
2. In the Team's Google Drive, open the file named API Tokens (https://docs.google.com/document/d/1dUSup56OvHKJWdhSUIE5RjaJvZmXjGY0zBlD3qfzys8/edit)
3. Copy all the contents of this file and paste it to the ".env" file
4. Save your ".env" file

## Testing

To run tests:

```shell
bin/rspec
```

To view test coverage, either run the above command and then open `coverage/index.html`; or go to GitHub Actions' rspec job details, expand the "Upload test coverage" step, download the artifact from the link, extract the archive, and open the `index.html` file.
