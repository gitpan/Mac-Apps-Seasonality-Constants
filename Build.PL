use strict;
use warnings;

use English qw{ −no_match_vars };

use Module::Build;


my $class;
my $builder;

$class = Module::Build->subclass( code => <<'SUBCLASS' );

    sub ACTION_authortest {
        my $self = shift;

        $self->dispatch('build');
        $self->recursive_test_files(1);
        $self->dispatch('test');
    } # end ACTION_authortest()

SUBCLASS

$builder = $class->new(
    module_name     => 'Mac::Apps::Seasonality::Constants',
    license         => 'perl',
    dist_author     => 'Elliot Shank <perl@galumph.com>',
    dist_abstract   =>
        "Define various constants relating to Seasonality (http://gauchosoft.com/Software/Seasonality/).",
    dynamic_config  => 1,
    build_requires  => {
        'version'           => 0,
        'Test::More'        => 0,
    },
    requires        => {
        'perl'              => '5.8.6',
        'version'           => 0,
        'Readonly'          => 0,
        'Regexp::Common'    => 0,
    },
    recommends      => {
        'File::Find::Rule'              => 0,
        'File::Slurp'                   => 0,
        'Perl::Critic'                  => 0,
        'Pod::Coverage::CountParents'   => 0,
        'Test::Distribution'            => 0,
        'Test::Perl::Critic'            => 0,
        'Test::Pod'                     => 0,
        'Test::Pod::Coverage'           => 0,
        'Test::Spelling'                => 0,
    },
    script_files    => [ glob('script/*') ],
    create_packlist => 1,
    sign            => 0,
    add_to_cleanup  => [
        'Mac-Apps-Seasonality-Constants-*',
        '*.vim_backup',
        'pod2htm?.tmp',
    ],
);


$builder->create_build_script();

# setup vim: set filetype=perl tabstop=4 softtabstop=4 expandtab :
# setup vim: set shiftwidth=4 shiftround textwidth=0 nowrap autoindent :
# setup vim: set foldmethod=indent foldlevel=0 :
