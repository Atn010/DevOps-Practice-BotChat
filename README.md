# BotChat — End-to-End DevOps Pipeline for iOS Applications

This is a deliberately scoped system built to explore real DevOps constraints in iOS mobile development, including CI/CD orchestration, code review, and automated release workflows.

## Objective

This project is to design and implement an end-to-end DevOps workflow for iOS application development, demonstrating practical understanding of CI/CD, automation, containerized services, and release management in a mobile development context.

## Technology Used

### Application

- Swift - Programming Language
- SwiftUI - User Interface Framework
- Swift Package Manager - Dependency manager

### CI/CD and Automation

- Linux and macOS Terminal - Running commands and setting up
- Docker - Containerization
- N8N - Workflow automation
- GitHub Actions - CI/CD pipeline automation
- Fastlane - App build automation


### Secrets and Release Management

- Arkana – Environment-based secrets management
- App Store Connect API – Automating App Store operations using API keys

### Source Control

- Git – Code version control
- GitHub - Code Repository

## What the System Does

This Application is a simulation of an iOS App workflow with DevOps:

- A SwiftUI application example
- Dependency and setup with DevOps locally
- Connected to automated remote services

## Architecture Overview

1. Source code is hosted on GitHub
   - This serves as the single source of truth for CI/CD automation.
   - Fastlane Match can be invoked to retrieve signing certificates for development or release.
2. On pull request creation:
   1. Connect to the N8N instance
      1. Retrieve pull request
      2. Send the pull request with a prompt to analyze the code using Gemini
      3. Post the result to the pull request
   2. Connect to the designated build server
      1. Build the application
      2. Run Unit Test
      3. Run UI test
      4. Report to GitHub
3. When committing with "release" in the commit message
   1. Connect to the designated build server
   2. Increment the build number
   3. Build Application
   4. Send the app to App Store Connect

## DevOps Concepts Demonstrated

### Continuous Integration

The code is built before being merged into the `main` branch via a pull request. This enforces a quality gate before merge and mirrors production CI constraints.

### Continuous Testing

The code is tested when creating a pull request. It is built and must complete the unit test and UI test before it is ready for the next step.

An automated code review is conducted on a pull request by an AI agent to catch basic issues and report them in the pull request.

### Continuous Delivery

A release is triggered when a commit message contains the keyword `release`.  This automates the release process to a single word trigger, ready to be tested on a designated testflight user.

### Containerization

The N8N instances are in a container on a remote server. This approach ensures the N8N instance remains reproducible, maintainable, and easy to update.

### Automation Mindset

This project automates aspects of software development, reducing manual configuration or interaction to a necessity.

## How I Built This

### N8N web service

1. Set up `compose.yml` for N8N
2. Run `docker compose up`
3. Prepare a GitHub personal access token and Configure N8N
4. Prepare Google AI Studio for Gemini integration to N8N

>The goal is to set up a web service to be used by the CI/CD process using Docker

### SwiftUI App

1. Install Ruby Version Manager and Bundler
2. Set up Gemfile, include Fastlane and Arkana
3. Set up `.arkana.yml` and `.env` for Arkana secrets management
   - The secrets are for example purposes.
4. Run the Arkana function to create the SDK
5. Integrate the Arkana SDK into the Application

>The goal is to implement a CI/CD on a generalized iOS App. Arkana is an environment-based secrets management tool capable of generating SDKs for both iOS and Android. Because of this, the development environment can be added to the `.gitignore` file.

### N8N Code Review

1. Configure workflow for AI code review
2. Add credentials and create prompts

>N8N integration is to automate prompting to other AI models. The integration also allows handling other tasks such as saving to a Google Sheets or notifying team members via Slack.

### GitHub Actions

1. Use the starter `ios.yml` from GitHub
2. Modify `ios.yml` to conditionally run tests or perform production builds based on the workflow context.
3. Prepare for Fastlane integration

>GitHub Actions allows running commands on a build device. For this instance, triggering a Build and Test or a Fastlane Deploy command

### Fastlane Integration

1. Set up Fastlane with `bundle exec fastlane init`
2. Configure `Fastfile` and `.env` for fastlane
   - The secrets are for example purposes.
   - Note that the `.env` for Arkana is different from the `.env` for Fastlane
3. Test implementation with `bundle exec fastlane deploy`

>Fastlane Integration allows many CI/CD capabilities for automating iOS App development and release.

## What I Learned

- CI/CD pipeline setup
  - Steps taken to create CI/CD for Mobile Development
  - Understanding potential automation avenues to improve developer experience
- Docker workflow
  - Understanding and using Docker to implement web services in support of CI/CD automation
- Structuring a production-ready application
- Importance of automation in DevOps
  - Improved error detection and reduced the effort required to update and release the application
- Git strategy
  - Separating the `main` branch from feature branches (e.g., `feat/*`)

## Future Improvements

- Implement SonarQube for static code analysis
- Implement Fastlane Screenshot for updating App Store image
- Implement Fastlane Deliver for releasing the App
- Implement Sentry for Bug Tracking

## Repository

<https://github.com/Atn010/DevOps-Practice-BotChat>
