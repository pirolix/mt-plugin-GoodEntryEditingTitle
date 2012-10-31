package OMV::GoodEntryEditingTitle::Callbacks;
# GoodEntryEditingTitle (C) 2012 Piroli YUKARINOMIYA (Open MagicVox.net)
# This program is distributed under the terms of the GNU Lesser General Public License, version 3.
# $Id$

use strict;
use warnings;
use MT;

sub instance { MT->component((__PACKAGE__ =~ /^(\w+::\w+)/g)[0]); }

### MT::App::CMS::template_source.edit_entry
sub template_source_edit_entry {
    my ($cb, $app, $tmpl) = @_;

    # Modify to add the entry's title
    chomp (my $old = <<'MTMLHEREDOC');
<mt:include name="include/header.tmpl"
MTMLHEREDOC
    $old = quotemeta $old;
    my $new = &instance->translate_templatized (<<'MTMLHEREDOC');
<mt:if name="object_type" like="entry|page"><mt:if name="id">
<mt:setvarblock name="html_title">
<mt:var name="title" default="<__trans phrase="(untitled)">" trim_to="40+..." escape="html"> - <mt:var name="page_title">
</mt:setvarblock>
</mt:if></mt:if>
MTMLHEREDOC
    $$tmpl =~ s/($old)/$new$1/;
}

1;