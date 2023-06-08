from typing import Union

from fastapi import FastAPI

import pandas as pd
from sklearn.feature_extraction.text import CountVectorizer

import joblib

app = FastAPI()

# [start] INITIALIZATIONS NEEDED FOR THE AI MODEL. ==============================================================================================
# 1. Load the custom stopwords from disk.
with open("custom_stopwords.txt", "r") as file:
    custom_stop_words = file.read().splitlines()

file.close()


# 2. Initialize the CountVectorizer.
cvect = CountVectorizer(
    stop_words=custom_stop_words,
    ngram_range=(1, 2),
    max_df=0.2,
    min_df=2,
    lowercase=False,
    binary=True,
)

# 3. Load the X_train data from disk.
X_train = pd.read_csv("X_train.csv")

# 4. Fit the X_train data to the CountVectorizer.
cvect.fit_transform(X_train["text"])

# 5. Load the Monomial Naive Bayes model from disk.
filename = "mnb_model.joblib"
mnb_model = joblib.load(filename)

# [end] INITIALIZATIONS NEEDED FOR THE AI MODEL. ================================================================================================


# Sample endpoint.
@app.get("/")
def read_root():
    return {"Hello": "World"}


# Sample endpoint with a query.
@app.get("/items/{item_id}")
def read_item(item_id: int, q: Union[str, None] = None):
    return {"item_id": item_id, "q": q}


# AIaaS endpoint.
@app.get("/is-text-toxic/")
def is_text_toxic(text: Union[str, None] = None):
    if text is None:
        return {"text": "[ No input text provided. ]"}

    # Vectorize the input text (i.e., convert it to a document-term-matrix).
    X_dtm = cvect.transform([text])

    # Make prediction.
    prediction = mnb_model.predict(X_dtm)
    probability = mnb_model.predict_proba(X_dtm)

    print("\n")
    print("[text]:", text)
    print("[isToxic]:", bool(prediction))
    print("[non_toxic_prob]:", probability[0][0])
    print("[toxic_prob]:", probability[0][1])
    print("\n")

    return {
        "text": text,
        "is_toxic": bool(prediction[0]),
        "non_toxic_probability": probability[0][0],
        "toxic_probability": probability[0][1],
    }
