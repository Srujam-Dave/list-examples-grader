CPATH='.;lib/hamcrest-core-1.3.jar;lib/junit-4.13.2.jar'

rm -rf student-submission
rm -rf grading-area

mkdir grading-area

git clone $1 student-submission
echo 'Finished cloning'


# Draw a picture/take notes on the directory structure that's set up after
# getting to this point

# Then, add here code to compile and run, and do any post-processing of the
# tests
if [[ -f student-submission/ListExamples.java ]]
then
    echo "File Found"
else
    echo "File not found"
    exit
fi

cp TestListExamples.java grading-area
cp student-submission/ListExamples.java grading-area
cp -r lib grading-area

cd grading-area
javac -cp $CPATH *.java

if [[ $? -ne 0 ]]
then
    echo "womp womp ur code didn't compile. See error above"
    exit
else
    echo "Running Program."
fi

java -cp $CPATH org.junit.runner.JUnitCore TestListExamples > test-output.txt

testline=$(cat test-output.txt | tail -n 2)

if [[ $testline == *"Failures"* ]]
then
    numbers=$(echo $testline | grep -oE '[0-9]+' | sed 'N;s/\n/:/')
    tests_run=$(echo "$numbers" | awk -F: '{print $1}')
    failures=$(echo "$numbers" | awk -F: '{print $2}')
else
    tests_run=$(echo $testline | grep -oE '[0-9]+' | sed 'N;s/\n/:/')    
    failures=0
fi

successes=$((tests_run - failures))
echo "Tests ran. Your score is $successes / $tests_run"
