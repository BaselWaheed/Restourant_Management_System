import pandas as pd 
import numpy as np
import re
from nltk.corpus import stopwords
from sklearn.feature_extraction.text import CountVectorizer
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score , confusion_matrix # calculate accuracy
from sklearn.ensemble import RandomForestClassifier
from sklearn import preprocessing
from nltk.tokenize import word_tokenize
from nltk.stem import WordNetLemmatizer
dataset = pd.read_csv(r"desktop\Restaurant_Reviews.tsv",'\t', quoting=3)
dataset.head(-5)
def remove_non_ascii(text):
  """Remove non-ASCII characters from list of tokenized words"""
  return text.encode('ascii','ignore').decode()
def to_lowercase(text):
    return text.lower()
def replace_numbers(text):
  """Replace all interger occurrences in list of tokenized words with textual representation"""
  return re.sub(r'\d+','',text)
def remove_punctuation(text):
    punctuation= '''!()[]{};:'"\<>/?$%^&*_`~='''
    for punc in punctuation:
        text=text.replace(punc,"")
    return text
def text2words(text):
  return word_tokenize(text)
def remove_stopwords(words,stop_words):
  return [word for word in words if word not in stop_words]
def lemmatize_words(words):
    """Lemmatize words in text"""
    lemmatizer = WordNetLemmatizer()
    return [lemmatizer.lemmatize(word) for word in words]
stop_words=stopwords.words('english')
def normalize_text(text):
  text = remove_non_ascii(text)
  text = to_lowercase(text)
  text = replace_numbers(text)
  text = remove_punctuation(text)
  words = text2words(text)
    # words = remove_stopwords(words, stop_words)
  words = lemmatize_words(words)
  return ' '.join(words)
for i in range(len(dataset)):
    dataset["Review"][1] =normalize_text(dataset["Review"][1])
dataset.head(-5)
cv = CountVectorizer()
X = cv.fit_transform(dataset["Review"].apply(lambda x: np.str_(x)))
y=dataset['Liked']
le = preprocessing.LabelEncoder()
y=le.fit_transform(dataset['Liked'])
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size = 0.2 , random_state=100, shuffle=True)
clf = RandomForestClassifier()
clf.fit(X_train, y_train)
y_pred_rf = clf.predict(X_test)
tree_acc=accuracy_score(y_test,y_pred_rf)
cm = confusion_matrix(y_test , y_pred_rf)
print(cm)
print("Accuracy for Random forest : %0.5f \n\n" % tree_acc )
comment = str(input('please enter your comment \n'))
test_feature = cv.transform([comment])
print(clf.predict(test_feature))
