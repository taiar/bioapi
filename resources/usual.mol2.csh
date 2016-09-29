#!/bin/csh -f
# usual.mol2.csh from http://zinc.docking.org
# Run this script to download ZINC
# Requires curl (default) or wget, http://wget.docking.org
#
# Thus, to run this script
#         using curl, do:     csh usual.mol2.csh
#         using wget, do:     csh usual.mol2.csh wget
#
setenv base http://zinc.docking.org/db/byvendor/sialbb
setenv fn .zinc.$$
cat <<+ > $fn
sialbb_p0.0.mol2.gz
sialbb_p1.0.mol2.gz
+
if ($#argv>0) then
     wget --base=$base -i < $fn
else
     foreach i (`cat $fn`)
          curl --url $base/$i -o $i
     end
endif
rm -f $fn
# File created on  Tue Apr 21 10:31:21 PDT 2015
# This is the end of the csh script.
