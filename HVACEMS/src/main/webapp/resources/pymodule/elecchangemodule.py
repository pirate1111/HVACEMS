#!C:\\Users\\302-20\\AppData\\Roaming\\Microsoft\\Windows\\Start Menu\\Programs\\Python 3.12\\python

import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn.preprocessing import StandardScaler
from sklearn.tree import DecisionTreeClassifier, export_graphviz, plot_tree
from sklearn.model_selection import train_test_split, GridSearchCV
from sklearn.metrics import accuracy_score, classification_report, roc_curve, auc
from matplotlib import font_manager, rc
import sys

def main():
    # 한글 폰트 경로 설정
    font_path = "/Users/sun/Downloads/무제 폴더/D2Coding-Ver1.3.2-20180524/D2Coding/D2Coding-Ver1.3.2-20180524.ttc"
    font_name = font_manager.FontProperties(fname=font_path).get_name()
    rc('font', family=font_name)

    # 사용자 입력값 받기
    if len(sys.argv) != 5:
        print("Usage: python script_name.py temperature humidity pressure dust")
        sys.exit(1)

    temperature = float(sys.argv[1])
    humidity = float(sys.argv[2])
    pressure = float(sys.argv[3])
    dust = float(sys.argv[4])
    # parsedConsumeOperation = sys.argv[5]
    # parsedCooler = sys.argv[6]
    # parsedHeater = sys.argv[7]
    # parsedDehumidifier = sys.argv[8]
    # parsedConsumeEnergy = sys.argv[5]

    # print("파이썬")
    print("Temperature:", temperature)
    print("Humidity:", humidity)
    print("Pressure:", pressure)
    print("Dust:", dust)
    # print("parsedConsumeOperation", parsedConsumeOperation)
    # print("parsedCooler", parsedCooler)
    # print("parsedHeater", parsedHeater)
    # print("parsedDehumidifier", parsedDehumidifier)
    

    

    # csv 데이터 불러오기
    data = pd.read_csv("D:\\workspaces\\jsp\\HVACEMS\\src\\main\\webapp\\resources\\pymodule\\data0929_1.csv", encoding="CP949")

    # 데이터 전처리 과정 시각화
    num_features = len(data.columns) - 4  # 4개의 타겟 변수를 뺀 특성 개수 계산
    num_rows = (num_features + 1) // 2  # 서브플롯트 행 개수 계산

    plt.figure(figsize=(12, 6))

    # Box plot for each feature
    for i, feature in enumerate(data.columns[:-4]):  # 마지막 4개 열은 타겟 변수가 아니므로 제외
        if data[feature].dtype != 'object':  # 숫자형 열만 Box plot 생성
            plt.subplot(num_rows, 2, i + 1)
            sns.boxplot(x=data[feature])
            plt.title(f'Box Plot of {feature}')

    plt.tight_layout()
    # plt.show()

    # 탐색적 데이터 분석 (EDA)
    sns.pairplot(data, hue="공조기", diag_kind="kde")
    # plt.show()

    # 특성과 타겟 분리
    X = data[["온도", "습도", "기압", "분진"]]
    y = data[["공조기", "쿨러", "히터", "제습기"]]

    # 데이터 스케일링
    scaler = StandardScaler()
    X_scaled = scaler.fit_transform(X)

    # 데이터 분할 (학습용 70%, 검증용 15%, 시험용 15%)
    X_train, X_temp, y_train, y_temp = train_test_split(X_scaled, y, test_size=0.3, random_state=42)

    X_val, X_test, y_val, y_test = train_test_split(X_temp, y_temp, test_size=0.5, random_state=42)
    # 의사결정나무 모델 하이퍼파라미터 조정 및 최적 모델 찾기 위한 그리드 서치 수행
    param_grid = {
        'criterion': ['gini', 'entropy'],
        'max_depth': [None, 10, 20, 30, 40, 50, 60, 70, 80],
        'min_samples_split': [2, 5, 10, 15, 20],
        'min_samples_leaf': [1, 2, 4, 8, 10]
    }

    # (교차 검증 적용)
    model = DecisionTreeClassifier(random_state=42)
    grid_search = GridSearchCV(model, param_grid, cv=5, n_jobs=-1, verbose=1)
    grid_search.fit(X_train, y_train)

    # 최적의 하이퍼파라미터와 모델 구하기
    best_model = grid_search.best_estimator_

    # 의사결정나무 모델 학습 (최적 모델 적용)
    best_model.fit(X_train, y_train)

    # 모델 평가 (검증용 데이터)
    y_pred_val = best_model.predict(X_val)
    y_pred_test = best_model.predict(X_test)

    print("분류 모델 평가 결과 (검증용 데이터):")
    classification_rep_val = classification_report(y_val, y_pred_val, zero_division=1)
    print(classification_rep_val)

    print("분류 모델 평가 결과 (시험용 데이터):")
    classification_rep_test = classification_report(y_test, y_pred_test, zero_division=1)
    print(classification_rep_test)

    # 모델 정확도 계산 (검증용 데이터 및 시험용 데이터)
    accuracy_val = accuracy_score(y_val, y_pred_val)
    accuracy_test = accuracy_score(y_test, y_pred_test)

    print(f"모델 정확도 (검증용 데이터): {accuracy_val:.2f}")
    print(f"모델 정확도 (시험용 데이터): {accuracy_test:.2f}")

    # ROC 곡선 및 AUC 계산 및 그래프 시각화
    plt.figure(figsize=(15, 5))
    for i, target in enumerate(y.columns):
        fpr, tpr, thresholds = roc_curve(y_test[target], y_pred_test[:, i])
        roc_auc = auc(fpr, tpr)

        plt.subplot(1, num_features, i + 1)
        plt.plot(fpr, tpr, color='darkorange', lw=2, label=f'ROC curve (AUC = {roc_auc:.2f})')
        plt.plot([0, 1], [0, 1], color='navy', lw=2, linestyle='--')
        plt.xlim([0.0, 1.0])
        plt.ylim([0.0, 1.05])
        plt.xlabel('False Positive Rate')
        plt.ylabel('True Positive Rate')
        plt.title(f'ROC Curve for {target}')
        plt.legend(loc="lower right")

        plt.tight_layout()
        # plt.show()

    # 의사결정나무 시각화 (트리의 깊이를 3로 제한)
    plt.figure(figsize=(20, 10))
    plot_tree(best_model, filled=True, feature_names=X.columns, class_names=["No", "Yes"], max_depth=3)

      # plt.show()

    # 변수 중요도 시각화
    feature_importances = best_model.feature_importances_
    plt.figure(figsize=(10, 6))
    sns.barplot(x=feature_importances, y=X.columns)
    plt.xlabel('Feature Importance')
    plt.ylabel('Features')
    plt.title ('Variable Importance')
    # plt.show()


# 새로운 데이터 가동 여부 확인
    new_data = pd.DataFrame({
        "온도": [temperature],
        "습도": [humidity],
        "기압": [pressure],
        "분진": [dust]
    })

    # 입력한 새로운 데이터 스케일링
    new_data_scaled = scaler.transform(new_data)

    # 모델을 사용하여 분류 예측
    predictions = best_model.predict(new_data_scaled)

    def predict_aircon_power(temperature, humidity, pressure, dust):

        cop_weight = 0.3
        seer_weight = 0.3
        dust_weight = 0.4 
        cop = 3.0
        seer = 14.0
        q = temperature * 15 + humidity * 5 + pressure * 2 + dust * dust_weight
        power = (cop * q) / seer
        return power


    temperature, humidity, pressure, dust = new_data["온도"].values[0], new_data["습도"].values[0], new_data["기압"].values[0], new_data["분진"].values[0]
    parsedConsumeEnergy = predict_aircon_power(temperature, humidity, pressure, dust)

    # Print the results
    print("predictions:", predictions)
    print("parsedConsumeEnergy:", parsedConsumeEnergy)
    
    

    # 나머지 코드 (위에서부터 main 함수 내에 넣어주세요)
    
if __name__ == "__main__":
    main()
