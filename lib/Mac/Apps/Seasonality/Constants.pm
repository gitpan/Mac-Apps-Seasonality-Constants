package Mac::Apps::Seasonality::Constants;

use utf8;
use 5.008006;
use strict;
use warnings;

use version; our $VERSION = qv('v1.0.2');

use Exporter qw( import );

use Env;
use Readonly;

# General stuff.
Readonly our $SEASONALITY_NAME                  => 'Seasonality';
Readonly our $SEASONALITY_CREATOR               => 'GSSE';
Readonly our $SEASONALITY_HISTORY_DATABASE_NAME => 'weather.db';
## no critic (ValuesAndExpressions::RestrictLongStrings)
Readonly our $SEASONALITY_HISTORY_DATABASE_PATH =>
    "$ENV{HOME}/Library/Application Support/$SEASONALITY_NAME/$SEASONALITY_HISTORY_DATABASE_NAME";
## use critic

# Database tables.
Readonly our $SEASONALITY_HISTORY_TABLE         => 'icao_history';
Readonly our $SEASONALITY_DB_STATUS_TABLE       => 'db_status';

# Table columns.
Readonly our $SEASONALITY_HISTORY_COLUMN_ICAO               => 'icao';
Readonly our $SEASONALITY_HISTORY_COLUMN_DATE               => 'date';
Readonly our $SEASONALITY_HISTORY_COLUMN_WIND_DIRECTION     => 'wind_direction';
Readonly our $SEASONALITY_HISTORY_COLUMN_WIND_SPEED_KNOTS   => 'wind_speed_knots';
Readonly our $SEASONALITY_HISTORY_COLUMN_GUST_SPEED_KNOTS   => 'gust_speed_knots';
Readonly our $SEASONALITY_HISTORY_COLUMN_VISIBILITY_MILES   => 'visibility_miles';
Readonly our $SEASONALITY_HISTORY_COLUMN_TEMPERATURE_C      => 'temperature_c';
Readonly our $SEASONALITY_HISTORY_COLUMN_DEWPOINT_C         => 'dewpoint_c';
Readonly our $SEASONALITY_HISTORY_COLUMN_PRESSURE_HPA       => 'pressure_hpa';
Readonly our $SEASONALITY_HISTORY_COLUMN_RELATIVE_HUMIDITY  => 'relative_humidity';

Readonly our $SEASONALITY_DB_STATUS_COLUMN_NEW_RECORDS_SINCE_VACUUM
    => 'new_records_since_vacuum';


Readonly our $SEASONALITY_HISTORY_COLUMNS_REF => [
    $SEASONALITY_HISTORY_COLUMN_ICAO,
    $SEASONALITY_HISTORY_COLUMN_DATE,
    $SEASONALITY_HISTORY_COLUMN_WIND_DIRECTION,
    $SEASONALITY_HISTORY_COLUMN_WIND_SPEED_KNOTS,
    $SEASONALITY_HISTORY_COLUMN_GUST_SPEED_KNOTS,
    $SEASONALITY_HISTORY_COLUMN_VISIBILITY_MILES,
    $SEASONALITY_HISTORY_COLUMN_TEMPERATURE_C,
    $SEASONALITY_HISTORY_COLUMN_DEWPOINT_C,
    $SEASONALITY_HISTORY_COLUMN_PRESSURE_HPA,
    $SEASONALITY_HISTORY_COLUMN_RELATIVE_HUMIDITY,
];

Readonly our $SEASONALITY_HISTORY_COLUMNS_COUNT => scalar @{$SEASONALITY_HISTORY_COLUMNS_REF};


my $position_index = 0;

Readonly our $SEASONALITY_HISTORY_COLUMN_NUMBERS_BY_COLUMN_NAME_REF => {
    map { $_ => $position_index++ } @{$SEASONALITY_HISTORY_COLUMNS_REF}
};
Readonly our $SEASONALITY_HISTORY_COLUMN_NAMES_BY_COLUMN_NUMBER_REF => {
    map { $SEASONALITY_HISTORY_COLUMN_NUMBERS_BY_COLUMN_NAME_REF->{$_} => $_ }
        keys %{$SEASONALITY_HISTORY_COLUMN_NUMBERS_BY_COLUMN_NAME_REF}
};


# Data restrictions.
Readonly our $SEASONALITY_INVALID_DATA  => -1000;

Readonly our $SEASONALITY_ICAO_MINIMUM_LENGTH       =>    1;
Readonly our $SEASONALITY_ICAO_MAXIMUM_LENGTH       =>   32;
Readonly our $SEASONALITY_DATE_LENGTH               =>   12;
Readonly our $SEASONALITY_WIND_DIRECTION_MINIMUM    =>   -1;
Readonly our $SEASONALITY_WIND_DIRECTION_MAXIMUM    =>  360;
Readonly our $SEASONALITY_WIND_SPEED_MINIMUM        =>    0;    # Knots
Readonly our $SEASONALITY_WIND_SPEED_MAXIMUM        =>  300;
Readonly our $SEASONALITY_VISIBILITY_MINIMUM        =>    0.0;  # Miles
Readonly our $SEASONALITY_VISIBILITY_MAXIMUM        =>  200.0;
Readonly our $SEASONALITY_TEMPERATURE_MINIMUM       => -247.0;  # Degrees C
Readonly our $SEASONALITY_TEMPERATURE_MAXIMUM       =>  100.0;
Readonly our $SEASONALITY_PRESSURE_MINIMUM          =>  800;    # Millibars/Heptopascals
Readonly our $SEASONALITY_PRESSURE_MAXIMUM          => 1200;
Readonly our $SEASONALITY_RELATIVE_HUMIDITY_MINIMUM =>    0;    # %
Readonly our $SEASONALITY_RELATIVE_HUMIDITY_MAXIMUM =>  100;


our @EXPORT_OK      = qw{
    $SEASONALITY_NAME
    $SEASONALITY_CREATOR
    $SEASONALITY_HISTORY_DATABASE_NAME
    $SEASONALITY_HISTORY_DATABASE_PATH


    $SEASONALITY_HISTORY_TABLE
    $SEASONALITY_DB_STATUS_TABLE

    $SEASONALITY_HISTORY_COLUMN_ICAO                $SEASONALITY_HISTORY_COLUMN_DATE
    $SEASONALITY_HISTORY_COLUMN_WIND_DIRECTION      $SEASONALITY_HISTORY_COLUMN_WIND_SPEED_KNOTS
    $SEASONALITY_HISTORY_COLUMN_GUST_SPEED_KNOTS    $SEASONALITY_HISTORY_COLUMN_VISIBILITY_MILES
    $SEASONALITY_HISTORY_COLUMN_TEMPERATURE_C       $SEASONALITY_HISTORY_COLUMN_DEWPOINT_C
    $SEASONALITY_HISTORY_COLUMN_PRESSURE_HPA        $SEASONALITY_HISTORY_COLUMN_RELATIVE_HUMIDITY

    $SEASONALITY_DB_STATUS_COLUMN_NEW_RECORDS_SINCE_VACUUM

    $SEASONALITY_HISTORY_COLUMNS_REF
    $SEASONALITY_HISTORY_COLUMNS_COUNT
    $SEASONALITY_HISTORY_COLUMN_NUMBERS_BY_COLUMN_NAME_REF
    $SEASONALITY_HISTORY_COLUMN_NAMES_BY_COLUMN_NUMBER_REF


    $SEASONALITY_INVALID_DATA

    $SEASONALITY_ICAO_MINIMUM_LENGTH        $SEASONALITY_ICAO_MAXIMUM_LENGTH
    $SEASONALITY_DATE_LENGTH
    $SEASONALITY_TEMPERATURE_MINIMUM        $SEASONALITY_TEMPERATURE_MAXIMUM
    $SEASONALITY_WIND_DIRECTION_MINIMUM     $SEASONALITY_WIND_DIRECTION_MAXIMUM
    $SEASONALITY_WIND_SPEED_MINIMUM         $SEASONALITY_WIND_SPEED_MAXIMUM
    $SEASONALITY_VISIBILITY_MINIMUM         $SEASONALITY_VISIBILITY_MAXIMUM
    $SEASONALITY_PRESSURE_MINIMUM           $SEASONALITY_PRESSURE_MAXIMUM
    $SEASONALITY_RELATIVE_HUMIDITY_MINIMUM  $SEASONALITY_RELATIVE_HUMIDITY_MAXIMUM
};
our %EXPORT_TAGS    = (
    all             => [@EXPORT_OK],
    application => [
        qw{
            $SEASONALITY_NAME
            $SEASONALITY_CREATOR
            $SEASONALITY_HISTORY_DATABASE_NAME
            $SEASONALITY_HISTORY_DATABASE_PATH
        }
    ],
    database        => [
        qw{
            $SEASONALITY_HISTORY_TABLE
            $SEASONALITY_DB_STATUS_TABLE

            $SEASONALITY_HISTORY_COLUMN_ICAO                $SEASONALITY_HISTORY_COLUMN_DATE
            $SEASONALITY_HISTORY_COLUMN_WIND_DIRECTION      $SEASONALITY_HISTORY_COLUMN_WIND_SPEED_KNOTS
            $SEASONALITY_HISTORY_COLUMN_GUST_SPEED_KNOTS    $SEASONALITY_HISTORY_COLUMN_VISIBILITY_MILES
            $SEASONALITY_HISTORY_COLUMN_TEMPERATURE_C       $SEASONALITY_HISTORY_COLUMN_DEWPOINT_C
            $SEASONALITY_HISTORY_COLUMN_PRESSURE_HPA        $SEASONALITY_HISTORY_COLUMN_RELATIVE_HUMIDITY

            $SEASONALITY_DB_STATUS_COLUMN_NEW_RECORDS_SINCE_VACUUM

            $SEASONALITY_HISTORY_COLUMNS_REF
            $SEASONALITY_HISTORY_COLUMNS_COUNT
            $SEASONALITY_HISTORY_COLUMN_NUMBERS_BY_COLUMN_NAME_REF
            $SEASONALITY_HISTORY_COLUMN_NAMES_BY_COLUMN_NUMBER_REF
        }
    ],
    data            => [
        qw{
            $SEASONALITY_INVALID_DATA

            $SEASONALITY_ICAO_MINIMUM_LENGTH        $SEASONALITY_ICAO_MAXIMUM_LENGTH
            $SEASONALITY_DATE_LENGTH
            $SEASONALITY_TEMPERATURE_MINIMUM        $SEASONALITY_TEMPERATURE_MAXIMUM
            $SEASONALITY_WIND_DIRECTION_MINIMUM     $SEASONALITY_WIND_DIRECTION_MAXIMUM
            $SEASONALITY_WIND_SPEED_MINIMUM         $SEASONALITY_WIND_SPEED_MAXIMUM
            $SEASONALITY_VISIBILITY_MINIMUM         $SEASONALITY_VISIBILITY_MAXIMUM
            $SEASONALITY_PRESSURE_MINIMUM           $SEASONALITY_PRESSURE_MAXIMUM
            $SEASONALITY_RELATIVE_HUMIDITY_MINIMUM  $SEASONALITY_RELATIVE_HUMIDITY_MAXIMUM
        }
    ],
);

1; # Magic true value required at end of module

__END__

=encoding utf8

=for stopwords metadata SQLite ICAO ICAOs humidities

=head1 NAME

Mac::Apps::Seasonality::Constants - Static definitions of aspects of Seasonality.


=head1 VERSION

This document describes Mac::Apps::Seasonality::Constants version 1.0.2.


=head1 SYNOPSIS

    use Mac::Apps::Seasonality::Constants qw{
        $SEASONALITY_NAME
        $SEASONALITY_CREATOR
        $SEASONALITY_HISTORY_DATABASE_PATH
    };


    use Mac::Apps::Seasonality::Constants qw{
        $SEASONALITY_HISTORY_TABLE
        $SEASONALITY_HISTORY_COLUMN_ICAO
        $SEASONALITY_HISTORY_COLUMN_TEMPERATURE_C
    };


    use Mac::Apps::Seasonality::Constants qw{
        $SEASONALITY_DB_STATUS_TABLE
        $SEASONALITY_DB_STATUS_COLUMN_NEW_RECORDS_SINCE_VACUUM
    };


    use Mac::Apps::Seasonality::Constants qw{
        $SEASONALITY_HISTORY_COLUMNS_REF
        $SEASONALITY_HISTORY_COLUMN_NUMBERS_BY_COLUMN_NAME_REF
        $SEASONALITY_HISTORY_COLUMN_NAMES_BY_COLUMN_NUMBER_REF
    };

    use Mac::Apps::Seasonality::Constants qw{
        $SEASONALITY_INVALID_DATA
        $SEASONALITY_TEMPERATURE_MINIMUM
        $SEASONALITY_TEMPERATURE_MAXIMUM
    };


    use Mac::Apps::Seasonality::Constants qw{ :all };
    use Mac::Apps::Seasonality::Constants qw{ :application };
    use Mac::Apps::Seasonality::Constants qw{ :database };
    use Mac::Apps::Seasonality::Constants qw{ :data };


=head1 DESCRIPTION

This provides static metadata about Seasonality via "constants".  The exposed
values are made immutable via L<Readonly> and not L<constant>, so they are
usable within string interpolation, etc.

None of the values are exported by default to avoid the possibility of name
clashes, though the names should be unique enough for most uses.  Each value
must individually be imported or with one of the following tags:

=over

=item C<:all>

All constants.

=item C<:application>

The application name and creator code.  The name of and default path to the
weather history database.

=item C<:database>

The database table and column names.

=item C<:data>

The missing data indicator value and the limits on each type of data.

=back


=head1 INTERFACE

=head2 General Information

=over

=item C<$SEASONALITY_NAME>

The name of the application.  Defined so that there's one central place for
this in case it needs to be enhanced/changed in the future.


=item C<$SEASONALITY_CREATOR>

The Mac OS creator code for the application.


=back


=head2 Database and Tables

=over

=item C<$SEASONALITY_HISTORY_DATABASE_NAME>

The name of the SQLite database file that the historical data is stored in.
Note that this is just the base name, and does not contain any path components.

=item C<$SEASONALITY_HISTORY_DATABASE_PATH>

The path of the default location of the SQLite database file that the
historical data is stored in.

=item C<$SEASONALITY_HISTORY_TABLE>

The name of the database table that the historical ICAO data is stored in.


=item C<$SEASONALITY_DB_STATUS_TABLE>

The name of the database table that the overall database health is kept in.


=back


=head2 Table Columns

=over

=item C<$SEASONALITY_HISTORY_COLUMN_ICAO>, C<$SEASONALITY_HISTORY_COLUMN_DATE>,
C<$SEASONALITY_HISTORY_COLUMN_WIND_DIRECTION>,
C<$SEASONALITY_HISTORY_COLUMN_WIND_SPEED_KNOTS>,
C<$SEASONALITY_HISTORY_COLUMN_GUST_SPEED_KNOTS>,
C<$SEASONALITY_HISTORY_COLUMN_VISIBILITY_MILES>,
C<$SEASONALITY_HISTORY_COLUMN_TEMPERATURE_C>,
C<$SEASONALITY_HISTORY_COLUMN_DEWPOINT_C>,
C<$SEASONALITY_HISTORY_COLUMN_PRESSURE_HPA>,
C<$SEASONALITY_HISTORY_COLUMN_RELATIVE_HUMIDITY>

The individual column names in the history table.


=item C<$SEASONALITY_DB_STATUS_COLUMN_NEW_RECORDS_SINCE_VACUUM>

The individual column names in the database status table.


=item C<$SEASONALITY_HISTORY_COLUMNS_REF>

Reference to an array of the names of the history table columns, in database
schema order.


=item C<$SEASONALITY_HISTORY_COLUMN_NUMBERS_BY_COLUMN_NAME_REF>

Reference to a hash mapping from column numbers to history column names.


=item C<$SEASONALITY_HISTORY_COLUMN_NAMES_BY_COLUMN_NUMBER_REF>

Reference to a hash mapping from history column names to column numbers.


=back


=head2 Data Limits

=over

=item C<$SEASONALITY_INVALID_DATA>

The numeric value that is used to denote the data from the source is missing or
invalid.


=item C<$SEASONALITY_ICAO_MINIMUM_LENGTH>, C<$SEASONALITY_ICAO_MAXIMUM_LENGTH>

The range of valid sizes for ICAOs.


=item C<$SEASONALITY_TEMPERATURE_MINIMUM>, C<$SEASONALITY_TEMPERATURE_MAXIMUM>

The range of valid temperatures, in °C.


=item C<$SEASONALITY_WIND_DIRECTION_MINIMUM>,
C<$SEASONALITY_WIND_DIRECTION_MAXIMUM>

The range of valid wind directions, in compass degrees. -1 indicates
"variable".


=item C<$SEASONALITY_WIND_SPEED_MINIMUM>, C<$SEASONALITY_WIND_SPEED_MAXIMUM>

The range of valid wind speeds, in knots.


=item C<$SEASONALITY_VISIBILITY_MINIMUM>, C<$SEASONALITY_VISIBILITY_MAXIMUM>

The range of valid visibilities, in miles.


=item C<$SEASONALITY_PRESSURE_MINIMUM>, C<$SEASONALITY_PRESSURE_MAXIMUM>

The range of valid atmospheric pressures, in millibars/heptopascals.


=item C<$SEASONALITY_RELATIVE_HUMIDITY_MINIMUM>, C<$SEASONALITY_RELATIVE_HUMIDITY_MAXIMUM>

The range of valid humidities, in percentages.


=back


=head1 DIAGNOSTICS

None, since there's no subroutines in this module.


=head1 CONFIGURATION AND ENVIRONMENT

Mac::Apps::Seasonality::Constants requires no configuration files or
environment variables.


=head1 DEPENDENCIES

L<Readonly>


=head1 INCOMPATIBILITIES

None reported.


=head1 BUGS AND LIMITATIONS

No bugs have been reported.

Please report any bugs or feature requests to
C<bug-mac-apps-seasonality-loadicaohistory@rt.cpan.org>, or through the web
interface at L<http://rt.cpan.org>.


=head1 AUTHOR

Elliot Shank  C<< perl@galumph.com >>


=head1 LICENSE AND COPYRIGHT

Copyright ©2006-2008, Elliot Shank C<< perl@galumph.com >>. All rights
reserved.

This module is free software; you can redistribute it and/or
modify it under the same terms as Perl itself. See L<perlartistic>.


=head1 DISCLAIMER OF WARRANTY

BECAUSE THIS SOFTWARE IS LICENSED FREE OF CHARGE, THERE IS NO WARRANTY FOR THE
SOFTWARE, TO THE EXTENT PERMITTED BY APPLICABLE LAW. EXCEPT WHEN OTHERWISE
STATED IN WRITING THE COPYRIGHT HOLDERS AND/OR OTHER PARTIES PROVIDE THE
SOFTWARE "AS IS" WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESSED OR IMPLIED,
INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND
FITNESS FOR A PARTICULAR PURPOSE. THE ENTIRE RISK AS TO THE QUALITY AND
PERFORMANCE OF THE SOFTWARE IS WITH YOU. SHOULD THE SOFTWARE PROVE DEFECTIVE,
YOU ASSUME THE COST OF ALL NECESSARY SERVICING, REPAIR, OR CORRECTION.

IN NO EVENT UNLESS REQUIRED BY APPLICABLE LAW OR AGREED TO IN WRITING WILL ANY
COPYRIGHT HOLDER, OR ANY OTHER PARTY WHO MAY MODIFY AND/OR REDISTRIBUTE THE
SOFTWARE AS PERMITTED BY THE ABOVE LICENSE, BE LIABLE TO YOU FOR DAMAGES,
INCLUDING ANY GENERAL, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGES ARISING
OUT OF THE USE OR INABILITY TO USE THE SOFTWARE (INCLUDING BUT NOT LIMITED TO
LOSS OF DATA OR DATA BEING RENDERED INACCURATE OR LOSSES SUSTAINED BY YOU OR
THIRD PARTIES OR A FAILURE OF THE SOFTWARE TO OPERATE WITH ANY OTHER SOFTWARE),
EVEN IF SUCH HOLDER OR OTHER PARTY HAS BEEN ADVISED OF THE POSSIBILITY OF SUCH
DAMAGES.


=cut

# setup vim: set filetype=perl tabstop=4 softtabstop=4 expandtab :
# setup vim: set shiftwidth=4 shiftround textwidth=0 nowrap autoindent :
# setup vim: set foldmethod=indent foldlevel=0 :
