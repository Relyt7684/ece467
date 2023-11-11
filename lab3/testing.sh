RESULTS="results.txt"
RESULT_OFF="results_official.txt"
rm $RESULTS
rm $RESULT_OFF
for file in "testcases"/*; do
    # Check if the file is a regular file
    if [ -f "$file" ]; then
        echo "Processing file: $file"
        # Perform operations on the file here
        echo "$file" >> $RESULTS
        A3Sema $file >> $RESULTS
        echo "" >> $RESULTS
        echo "$file" >> $RESULT_OFF
        A3Sema-ref $file >> $RESULT_OFF
        echo "" >> $RESULT_OFF
        
    fi
done
diff $RESULTS $RESULT_OFF > results_diff.txt
