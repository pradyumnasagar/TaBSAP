#!/usr/bin/awk -f
BEGIN {
    width = 0;
}
{   
    if (width < NF)
        width = NF;
    for (n = 1; n <= NF; ++n) {
        if ( $n ~ /^[0-9]+$/ ) {
            number[n] += $n;
            total[n] += 1;
        } else {
            others[n] += $n;
        }
    }
    print;
    next;
}
END {
    printf "sum";
    for (n = 1; n <= width; ++n) {
        printf "%5d", number[n];
    }
    printf "\n";
    printf "total";
    for (n = 1; n <= width; ++n) {
        printf "%5d", total[n];
    }
    printf "\n";
    printf "percent";
    for (n = 1; n <= width; ++n) {
        if ( total[n] != 0) {
            printf "%5d", 100 * number[n] / total[n];
        } else {
            printf "%5d", 0;
        }
    }
    printf "\n";
}
