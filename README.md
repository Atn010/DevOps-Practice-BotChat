# BotChat - a DevOps practice app

Simple iOS App to highlight multiple DevOps systems - all the secrets in the App are dummies

## Objective

Build a simple DevOps workflow for iOS App development with DevOps integration.

Highlighting my understanding and application of DevOps for mobile app development.

## Technology Used

- Linux and MacOS Terminal - Running commands and setting up
- Docker - Containerization
- N8N - Workflow automation
- Git - Code Versioning managemennt
- Github - Code Repository
- Github Actions - CI/CD pipeline automation
- Fastlane - App build automation
- Swift - Programming Language
- SwiftUI - User Interface Framework
- Swift Package Manager - Dependency manager
- Arkana - Secrets management
- App Store Connect API - For automating App Store Action using API Key

## What the System Does

This Application is a simulation of an IOS App workflow with DevOps:

- Simple SwiftUI application example
- Dependency and setup with DevOps locally
- Connected to automated remote services

## Architecture Overview

1. Source code is stored on GitHub
   - When required, able to run Fastlane Match to retrieve the signing certificate for development or release
2. When creating a pull request
   1. Connect to the N8N instance
      1. Retrieve pull request
      2. Run a filter on the code to get the differences
      3. Send code with prompt to AI (Gemini)
      4. Post the result to Pull Request
   2. Connect to the designated build server
      1. Build the application
      2. Run Unit Test
      3. Run UI test
      4. Report to GitHub
3. When committing with "release" in the commit message
   1. Connect to the designated build server
   2. increment build number
   3. Build Application
   4. Send the app to App Store Connect

## DevOps Concepts Demonstrated

### Continious Intergration

The code is built before entering the Main branch via pull request. Thus, verifying the code is stable.

### Continuous Testing

The code is tested when creating a pull request. It is built, and must complete the unit test and ui test before ready for the next step.

An automated code review is conducted on a pull request by an AI agent to catch basic issues and report them in the pull request.

### Continuous Delivery

Release can be triggered on commit with the commit message that contains the word "release". This automates the release process to a single word trigger, ready to be tested on a designated testflight user.

### Containerization

The N8N instances are in a container on a remote server. This is deployed in a way to ensure the N8N instance is manageable and updated constantly.

### Automation Mindset

This project automates aspects of software development, reducing manual configuration or interaction to a necessity.

## How I Built This

### N8N web service

1. Set up `compose.yml` for N8N
2. Run `docker compose up`
3. Prepare GitHub personal key and Configure N8N
4. Configure Gemini to N8N

### SwiftUI App

1. Create the Application
2. Install Ruby Version Manager and Bundler
3. Set up Gemfile, include Fastlane and Arkana
4. Set up `.arkana.yml` and `.env` for Arkana secrets management
   - The secrets are dummies for example purposes.
5. Run the Arkana function to create the SDK
6. Integrate the Arkana SDK into the Application

### N8N Code Review

1. Configure workflow for AI code review
2. Add credentials and create prompts

### Github Action

1. Use the starter `ios.yml` from GitHub
2. Modify `ios.yml` to run, and add a condition to ignore the tests, or build for production
3. Prepare for Fastlane integration

### Fastlane Integration

1. Set up Fastlane with `bundle exec fastlane init`
2. Configure `Fastfile` and `.env` for fastlane
   - The secrets are dummies for example purposes.
   - Note that the `.env` for Arkana is different from the `.env` for Fastlane
3. Test implementation with `bundle exec fastlane deploy`

## What I Learned

- CICD pipeline setup
- Docker workflow
- Structuring a production-ready application
- Importance of automation in DevOps
- Git strategy

## Future Improvements

- Implement SonarQube for static code analysis
- Implement Fastlane Screenshot for updating App Store image
- Implement Fastlane Deliver for releasing the App
- Implement Sentry for Bug Tracking

## Repository

<https://github.com/Atn010/DevOps-Practice-BotChat>
