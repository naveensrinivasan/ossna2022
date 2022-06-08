package main

import (
	"github.com/saschagrunert/demo"
	. "github.com/saschagrunert/demo"
)

func main() {
	// Create a new demo CLI application
	d := demo.New()

	// Register the demo run
	d.Add(example(), "demo-0", "scorecard cli basic usage.")

	// Run the application, which registers all signal handlers and waits for
	// the app to exit
	d.Run()
}

// example is the single demo run for this application
func example() *Run {
	// A new run contains a title and an optional description
	r := NewRun(
		"Scorecard",
		"Shout out to Sascha Grunert for creating this demo package that I am using https://github.com/saschagrunert/demo",
	)

	r.Step(S("How to get scorecard?",
		"brew install scorecard",
		"nix-shell -p nixpkgs.scorecard",
		"https://github.com/ossf/scorecard/releases/latest",
	), nil)

	// A single step can consist of a description and a command to be executed
	r.Step(S(
		"Scorecard options",
	), S(
		"scorecard --help",
	))

	r.Step(S(
		"Scorecard running against github.com/ossf/scorecard for Branch-Protection check",
	), S(
		"scorecard --repo=github.com/ossf/scorecard --checks=Branch-Protection",
	))

	r.Step(S(
		"Lets enable additional details on why we got a score less than 10",
		"This is useful for debugging the score factors",
	), S(
		"scorecard --repo=github.com/ossf/scorecard --checks=Branch-Protection --show-details",
	))

	r.Step(S("This is cool, but can we get some json love?"), S(
		"scorecard --repo=github.com/ossf/scorecard --checks=Branch-Protection --format=json --show-details | jq .",
	))

	/*

		// Commands do not need to have a description, so we could set it to `nil`
		r.Step(nil, S(
			"echo without description",
			"but this can be executed in",
			"multiple lines as well",
		))

		// It is also not needed at all to provide a command
		r.Step(S(
			"Just a description without a command",
		), nil)
	*/

	return r
}
