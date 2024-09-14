# Podcast Generator GitHub Action

## Overview

The **Podcast Generator** GitHub Action automates the process of generating podcast feeds from YAML files. This action allows you to easily update your podcast feed and commit changes directly to your repository, streamlining your podcast management workflow.

## Features

- **Automatic Feed Generation**: Converts YAML data into a podcast feed.
- **Git Configuration**: Configures git settings to commit changes.
- **Customizable Inputs**: Set the committer's name and email for git commits.

## Usage

1. **Create a `.github/workflows` directory in your repository if it doesn’t exist.**

2. **Add a workflow file** (e.g., `podcast-generator.yml`) to the `.github/workflows` directory with the following content:

    ```yaml
    name: Podcast Generator

    on:
      push:
        branches:
          - main

    jobs:
      build:
        runs-on: ubuntu-latest

        steps:
        - name: Checkout code
          uses: actions/checkout@v3

        - name: Run Podcast Generator
          uses: ImmanuelThomasj/Podcast_Generator@v1
          with:
            email: ${{ secrets.GITHUB_ACTOR }}@localhost
            name: ${{ secrets.GITHUB_ACTOR }}
    ```

3. **Configure your action**:

    - `email`: The committer's email address. (Required)
    - `name`: The committer's name. (Required)

## Inputs

- `email`: The email address to use for git commits.
- `name`: The name to use for git commits.

## Example

Here’s an example of how to use the action in your GitHub workflow:

```yaml
name: Update Podcast Feed

on:
  schedule:
    - cron: '0 0 * * 1'  # Runs every Monday at midnight

jobs:
  generate-feed:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repository
        uses: actions/checkout@v3

      - name: Generate Podcast Feed
        uses: ImmanuelThomasj/Podcast_Generator@v1
        with:
          email: your-email@example.com
          name: Your Name
