# Toy Robot challenge

## Running a simulation

`./bin/run <robots-file>` there are some examples under the `spec/fixtures` directory.

## Development

#### Running console for manual testing.
`./bin/console`

#### Running tests
`bundle exec rake`

## Design decisions

##### Not using constants
After experimenting with constants I decided not to use them in this program, the reason for this is because constants are mutable and I really wanted to try keep objects immutable in this solution where possible. Originally I had the compass, left and right methods as constants within the Direction class but having the ability to change these at runtime is quite dangerious to the programs state.

##### Transformations in the Direction class
I made the decision to have the transformations inside the Direction class because I wanted to keep the knowledge of west, north, east and south contained within the Direction class.

##### Only checking class equality in the Robot class

Following TDD I haven't come accross a failing test that requires me to check class equality on the other objects yet. If you remove it for the robot though a test will fail.
