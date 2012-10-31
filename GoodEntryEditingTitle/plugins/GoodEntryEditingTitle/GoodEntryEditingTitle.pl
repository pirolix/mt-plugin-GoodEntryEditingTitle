package MT::Plugin::Editing::OMV::GoodEntryEditingTitle;
# GoodEntryEditingTitle (C) 2012 Piroli YUKARINOMIYA (Open MagicVox.net)
# This program is distributed under the terms of the GNU Lesser General Public License, version 3.
# $Id$

use strict;
use MT 4;

use vars qw( $VENDOR $MYNAME $FULLNAME $VERSION );
$FULLNAME = join '::',
        (($VENDOR, $MYNAME) = (split /::/, __PACKAGE__)[-2, -1]);
(my $revision = '$Rev$') =~ s/\D//g;
$VERSION = 'v0.10'. ($revision ? ".$revision" : '');

use base qw( MT::Plugin );
my $plugin = __PACKAGE__->new ({
    id => $FULLNAME,
    key => $FULLNAME,
    name => $MYNAME,
    version => $VERSION,
    author_name => 'Open MagicVox.net',
    author_link => 'http://www.magicvox.net/',
    plugin_link => 'http://www.magicvox.net/archive/2012/10311813/', # Blog
    doc_link => 'http://lab.magicvox.net/trac/mt-plugins/wiki/GoodEntryEditingTitle', # tracWiki
    description => <<'HTMLHEREDOC',
<__trans phrase="Modify the editing screen title to be easy recognizable the current entry/webpage title.">
HTMLHEREDOC
    l10n_class => "${FULLNAME}::L10N",
    registry => {
        callbacks => {
            'MT::App::CMS::template_source.edit_entry' => "${FULLNAME}::Callbacks::template_source_edit_entry",
        },
    },
});
MT->add_plugin ($plugin);

sub instance { $plugin; }

1;