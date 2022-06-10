package main

import (
	"github.com/saschagrunert/demo"
	. "github.com/saschagrunert/demo"
)

func main() {
	// Create a new demo CLI application
	d := demo.New()

	// Register the demo run
	d.Add(scorecard(), "demo-0", "scorecard cli basic usage.")
	d.Add(bq(), "demo-1", "scorecard BigQuery")

	// Run the application, which registers all signal handlers and waits for
	// the app to exit
	d.Run()
}

// scorecard is the single demo run for this application
func scorecard() *Run {
	// A new run contains a title and an optional description
	r := NewRun(
		"Scorecard",
		"Shout out to Sascha Grunert for creating this demo package https://github.com/saschagrunert/demo which is going to make me feel like 🦸.",
	)

	r.Step(S("How to install scorecard cli?",
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

	r.Step(S("Does scorecard support non-github repos?"), S(
		"scorecard --local-repo=. --show-details --format=json | jq .",
	))

	return r
}

func bq() *Run {
	r := NewRun(
		"Scorecard BigQuery",
		"Scorecard runs on a Cron job and scans more than 1000,000 repositories every week.Lets use ossf BigQuery to explore Scorecard data.",

	)
	r.Step(S("deps.dev parses dependencies for a given repository",
		"deps.dev stores the dependencies in BigQuery",
		"We are going to deps.dev BigQuery to get dependencies of Scorecard",
		"The BigQuery table to fetch dependencies is deps_dev_v1.DependencyGraphEdges"),

		S("bq query --use_legacy_sql=false 'SELECT `from`.Name FROM "+
			"`bigquery-public-data.deps_dev_v1.DependencyGraphEdges` "+
			"WHERE DATE(SnapshotAt) = \"2022-05-08\" AND "+
			"name LIKE \"github.com/ossf/scorecard\"'"))
	return r
}
