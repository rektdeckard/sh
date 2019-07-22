#!/bin/bash
# Do an ls for a nonexistent file
echo "ls myfilenot.c";
ls myfilenot.c;
echo Error Code: $?;
touch myfile.c;
echo "ls myfile.c";
ls myfile.c;
echo Error Code: $?;
rm myfile.c;
