SELECT
 count(*) AS BranchProtectinNotEnabled
FROM
  `openssf.scorecardcron.scorecard_latest` , unnest(checks) as c
WHERE Repo In (
"github.com/go-xmlfmt/xmlfmt",
"github.com/spf13/cobra",
"github.com/onsi/ginkgo",
"github.com/esimonov/ifshort",
"github.com/stretchr/testify",
"github.com/burntsushi/toml",
"github.com/ldez/tagliatelle",
"github.com/go-toolsmith/astcast",
"github.com/peterbourgon/diskv",
"github.com/jszwec/csvutil",
"github.com/spf13/viper",
"github.com/sourcegraph/go-diff",
"github.com/ssgreg/nlreturn",
"github.com/jstemmer/go-junit-report",
"github.com/golangci/dupl",
"github.com/ultraware/whitespace",
"github.com/mattn/go-colorable",
"github.com/spf13/cast",
"github.com/kyoh86/exportloopref",
"github.com/hashicorp/errwrap",
"github.com/golang/protobuf",
"github.com/timakin/bodyclose",
"github.com/dgrijalva/jwt-go",
"github.com/go-task/slim-sprig",
"github.com/bkielbasa/cyclop",
"github.com/gostaticanalysis/nilerr",
"github.com/polyfloyd/go-errorlint",
"github.com/quasilyte/regex",
"github.com/golangci/gofmt",
"github.com/gostaticanalysis/comment",
"github.com/containerd/typeurl",
"github.com/matttproud/golang_protobuf_extensions",
"github.com/google/go-github",
"github.com/go-git/gcfg",
"github.com/golangci/golangci-lint",
"github.com/kevinburke/ssh_config",
"github.com/prometheus/client_model",
"github.com/julz/importas",
"github.com/shurcool/githubv4",
"github.com/masterminds/semver",
"github.com/fzipp/gocyclo",
"github.com/golangci/misspell",
"github.com/fsnotify/fsnotify",
"github.com/jingyugao/rowserrcheck",
"github.com/gobwas/glob",
"github.com/spf13/pflag",
"github.com/naveensrinivasan/httpcache",
"github.com/kulti/thelper",
"github.com/kisielk/gotool",
"github.com/mattn/go-isatty",
"github.com/moricho/tparallel",
"github.com/go-toolsmith/astequal",
"github.com/olekukonko/tablewriter",
"github.com/davecgh/go-spew",
"github.com/golangci/maligned",
"github.com/cespare/xxhash",
"github.com/inconshreveable/mousetrap",
"github.com/go-git/go-git",
"github.com/gogo/protobuf",
"github.com/prometheus/procfs",
"github.com/tetafro/godot",
"github.com/maratori/testpackage",
"github.com/mgechev/dots",
"github.com/golangci/revgrep",
"github.com/subosito/gotenv",
"github.com/google/btree",
"github.com/hashicorp/hcl",
"github.com/go-toolsmith/strparse",
"github.com/gofrs/flock",
"github.com/gordonklaus/ineffassign",
"github.com/matoous/godox",
"github.com/ryanrolds/sqlclosecheck",
"github.com/phayes/checkstyle",
"github.com/shazow/go-diff",
"github.com/openpeedeep/depguard",
"github.com/tommy-muehle/go-mnd",
"github.com/googleapis/gax-go",
"github.com/imdario/mergo",
"github.com/kunwardeep/paralleltest",
"github.com/onsi/gomega",
"github.com/golangci/unconvert",
"github.com/shurcool/graphql",
"github.com/jirfag/go-printf-func-name",
"github.com/sergi/go-diff",
"github.com/ashanbrown/forbidigo",
"github.com/moby/buildkit",
"github.com/mitchellh/mapstructure",
"github.com/jbenet/go-context",
"github.com/gostaticanalysis/analysisutil",
"github.com/quasilyte/go-ruleguard",
"github.com/google/go-querystring",
"github.com/nakabonne/nestif",
"github.com/beorn7/perks",
"github.com/xanzy/ssh-agent",
"github.com/microsoft/go-winio",
"github.com/fatih/structtag",
"github.com/go-toolsmith/astp",
"github.com/jmespath/go-jmespath",
"github.com/ultraware/funlen",
"github.com/kisielk/errcheck",
"github.com/pelletier/go-toml",
"github.com/sirupsen/logrus",
"github.com/go-critic/go-critic",
"github.com/google/addlicense",
"github.com/bradleyfalzon/ghinstallation",
"github.com/census-instrumentation/opencensus-proto",
"github.com/nxadm/tail",
"github.com/emirpasic/gods",
"github.com/uudashr/gocognit",
"github.com/pkg/errors",
"github.com/prometheus/client_golang",
"github.com/stretchr/objx",
"github.com/mattn/go-runewidth",
"github.com/tdakkota/asciicheck",
"github.com/golangci/lint-1",
"github.com/tomarrell/wrapcheck",
"github.com/go-toolsmith/typep",
"github.com/golangci/check",
"github.com/daixiang0/gci",
"github.com/chavacava/garif",
"github.com/prometheus/common",
"github.com/acomagu/bufpipe",
"github.com/golangci/go-misc",
"github.com/charithe/durationcheck",
"github.com/nishanths/predeclared",
"github.com/ldez/gomoddirectives",
"github.com/mgechev/revive",
"github.com/securego/gosec",
"github.com/nbutton23/zxcvbn-go",
"github.com/mbilski/exhaustivestruct",
"github.com/alexkohler/prealloc",
"github.com/sanposhiho/wastedassign",
"github.com/golang/groupcache",
"github.com/fatih/color",
"github.com/mitchellh/go-homedir",
"github.com/aws/aws-sdk-go",
"github.com/go-git/go-billy",
"github.com/jgautheron/goconst",
"github.com/magiconair/properties",
"github.com/spf13/jwalterweatherman",
"github.com/nishanths/exhaustive",
"github.com/spf13/afero",
"github.com/go-toolsmith/astcopy",
"github.com/google/wire",
"github.com/pmezard/go-difflib",
"github.com/ashanbrown/makezero",
"github.com/gostaticanalysis/forcetypeassert",
"github.com/go-toolsmith/astfmt",
"github.com/sonatard/noctx",
"github.com/hashicorp/go-multierror",
"github.com/ettle/strcase",
"github.com/bombsimon/wsl",
"github.com/denis-tingajkin/go-header",
"github.com/ossf/scorecard",
"github.com/djarvur/go-err113",
"github.com/yeya24/promlinter",
"github.com/ryancurrah/gomodguard",
"github.com/google/go-cmp",
"github.com/h2non/filetype")
and c.Name = 'Branch-Protection'
and c.Pass = false;