
# Two Step Challenge Dashboard (Flutter Web)

This project is a responsive **Two Step Challenge** dashboard UI built with **Flutter Web** for both desktop and mobile, based on the provided design.

## 📸 Preview

### Desktop
- **Grid** layout with 2 columns.
- Cards have solid dark background with status badge and dashboard button.
- Displays challenge amount, balance, purchase date, account ID, status, and evaluation stage.

### Mobile
- Vertical **List** layout.
- Cards have gradient background.
- Same information as desktop version but adjusted to screen width.

---

## ✨ Features
- **Responsive Layout**
  - Mobile → ListView (vertical)
  - Desktop → GridView (2 columns)
- **Status Badges**:
  - Funded (Green)
  - On Challenge (Blue)
- **Evaluation Badges**:
  - Evaluation 1
  - Evaluation 2
  - Master Account
- **Gradient & Solid Background**:
  - Mobile → Gradient
  - Desktop → Solid Dark Color
- **Dashboard Button** on each card
- **Supports Flutter Web, iOS, Android**

---

## 📂 Project Structure
```
lib/
 ├── main.dart            # Application entry point
 ├── dashboard_page.dart  # Main dashboard page
 ├── challenge_model.dart # Challenge data model
 └── challenge_card.dart  # Challenge card widget
```

---

## 🚀 How to Run
Make sure you have **Flutter SDK** installed.

1. **Clone this repository**
   ```bash
   git clone https://github.com/username/two-step-challenge-dashboard.git
   cd two-step-challenge-dashboard
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run on Web**
   ```bash
   flutter run -d chrome
   ```

4. **Run on Mobile**
   - Android:
     ```bash
     flutter run -d android
     ```
   - iOS:
     ```bash
     flutter run -d ios
     ```

---

## ⚙️ Customization
- Update the challenge list in `DashboardPage` to match your needs.
- To add **hover effects** on Web, wrap `ChallengeCard` with a `MouseRegion` widget.

---

## 🛠 Technologies Used
- [Flutter](https://flutter.dev/)
- [Dart](https://dart.dev/)
- **Material Design**

---

## 📄 License
This project is licensed under the MIT License — free to use for personal and commercial purposes.

---

**Made with ❤️ using Flutter**
