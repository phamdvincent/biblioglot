# Biblioglot
Biblioglot is designed to be an intermediate language learning tool for students who have already completed beginner courses in their target languages, whether it's through apps like Duolingo or school courses. <br><br>
When students complete their course, they only know the very basics of a language, such as grammar, vocabulary, and basic listening comprehension. When introduced to more advanced resources like novels, there's a good chance that the student will not know the majority of the vocabulary and complex sentences that native speakers use. To look up definitions, they will have to manually look through a dictionary or type into an online resource, which takes an extraordinary amount of time. <br><br>
Even if the student is wiling to take the time to look through a dictionary, they will have a hard time knowing the pronunciation of the sentence and words they are reading. Traditionally, students will have to listen to pre-recorded audiobooks or find a native speaker to enhance their listening comprehension. Today, artificial intelligence has advanced to the point where machines can replicate native level speech, and entire stories can be recorded using text-to-speech services. Biblioglot will have the option to listen to an AI generated voice pronounce any sentence and word so the student can practice their listening any time they want.

## Use

Biblioglot is designed to be like a regular e-reader. You can read the text of a story just like any book, but you also have the option to click on every sentence. Clicking on a sentence will pop up a bubble that will give you access to the dictionary definitions of every word, audio pronunciation, and English translation. The gif''s below will demonstrate this flow.

### Sentence
![alt text](/app/assets/images/show_page.gif "Logo Title Text 1")

### Word
![alt text](/app/assets/images/word_list.gif "Logo Title Text 1")

## Administrator Console
There is an Administrator Console at the end of every book. This is meant only for those with an administrator account. This adds sentences to the story. The main use of the console is to copy paste a piece of text from a story in your target language, then press process. This will trigger the Story Processing Pipeline, which will make the sentence usable within Biblioglot. The console requires proper permissions from the API calls to use.

## Setup for Developers
Below are the directions for developers to get set up and start working with Biblioglot.

1) Fork the repository to your own github
2) Open a codespace for your local repository. The API keys are implemented using GitHub secrets, so codespace is best.
3) On the command line, type in the following commands:
   * bundle install
   * rails db:migrate
   * rake restart
   * bin/dev
4) Click on the `Ports` tab above the terminal and click on the link under `Forwarded Address` for Port 3000
5) You will now be sent to the sign up page. Either create a new account or use the admin account.
   * Email: admin@example.com
   * Password: password
6) You are now in the app! Play around as much as you like!

## Contribution
To contribute to the project, a developer can play around with Biblioglot and report any bugs or enhancements they think will improve the quality of the project.

* For bugs, create an Issue and describe as much as possible the bug and steps to reproduce.
* For enhancements, same thing as for bugs, but clarify that it is an enhancement.

To those who want to contribute code, there are a few conventions to note to make sure the project still functions as intended:

* All API calls are separated into services, which can be found in the app/services folder. If there needs to be changes to how the project API calls, please keep code changes to the appropriate service code.
   * Most, if not all, API calls use paid services, so you may need to sign up for a free tier of AWS and Deepl if you want to test how the project handles API calls, else you would have to use text that have already been processed.

* Create branches when making changes
   * Name the branch to be the feature you are changing. If you are changing the UI in the homepage, a branch name could be "fix-homepage-ui".

* When you complete making a change and are ready to merge your branch, create a pull request to be reviewed. Provide a brief description of what changes you made. A reviewer will look through the files that were change and will provide feedback on whether it can be merged or not.

## API
Biblioglot uses several paid API's for its main features. The API's are as follows:

AWS
* EC2 (https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EC2_GetStarted.html#ec2-get-started-overview)
* DynamoDB (https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/GettingStartedDynamoDB.html)
* S3 (https://aws.amazon.com/s3/getting-started/)
* Polly (https://docs.aws.amazon.com/sdk-for-ruby/v3/developer-guide/polly-example-synthesize-speech.html)

Translation
* Deepl (https://developers.deepl.com/docs)

For security, this repository uses Github secrets to store the API keys. The secrets are as follows:

* AWS_ACCESS_KEY_ID
* AWS_REGION
* AWS_SECRET_ACCESS_KEY
* DEEPL_KEY
* EC2_ADDRESS

`AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` are generated when creating an IAM account for AWS. Follow the instructions for creating an account and set access to be AdminstratorAccess.

`AWS_REGION` was mainly set to "us-east-2"

`DEEPL_KEY` is the API key for Deepl's translation service. You can get this by creating an account on Deepl and purchasing the API Pro subscription. Then create an API key.

`EC2_ADDRESS` is the address of the EC2 instance that houses the tokenization process. Contact me for the address as this is a heavy process that needs to be monitored.



