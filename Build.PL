use 5.008006;
use strict;
use warnings;

use English qw{ −no_match_vars };

use Module::Build;


my $class;
my $builder;

$class = Module::Build->subclass( code => <<'SUBCLASS' );

    sub ACTION_authortest {
        my $self = shift;

        $self->depends_on('build');
        $self->depends_on('manifest');
        $self->depends_on('distmeta');
        $self->recursive_test_files(1);
        $self->depends_on('test');
    } # end ACTION_authortest()

    sub ACTION_distdir {
        my $self = shift;

        $self->depends_on('authortest');

        $self->SUPER::ACTION_distdir;
    } # end ACTION_distdir

SUBCLASS

$builder = $class->new(
    module_name     => 'Mac::Apps::Seasonality::Constants',
    license         => 'perl',
    dist_author     => 'Elliot Shank <perl@galumph.com>',
    dist_abstract   =>
        "Define various constants relating to Seasonality (http://gauchosoft.com/Software/Seasonality/).",
    dynamic_config  => 1,
    build_requires  => {
        'Test::More'        => 0,
    },
    requires        => {
        'version'   => 0,
        'strict'    => 0,
        'warnings'  => 0,
        'utf8'      => 0,
        'Exporter'  => 0,
        'Env'       => 0,
        'Readonly'  => 0,
    },
    script_files    => [ glob('script/*') ],
    create_packlist => 1,
    sign            => 0,
    add_to_cleanup  => [
        qw{
            MANIFEST
            MANIFEST.bak
            META.yml
            Mac-Apps-Seasonality-Constants-*
            *.vim_backup
            pod2htm?.tmp
        }
    ],
);


$builder->create_build_script();

# setup vim: set filetype=perl tabstop=4 softtabstop=4 expandtab :
# setup vim: set shiftwidth=4 shiftround textwidth=0 nowrap autoindent :
# setup vim: set foldmethod=indent foldlevel=0 :
