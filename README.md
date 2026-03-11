<![CDATA[<div align="center">

# 🍼 TinySteps — DayCare+ App

**Smart Early Childhood Care Management System**  
*An internship project by [Your Organization Name]*

[![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter)](https://flutter.dev)
[![Supabase](https://img.shields.io/badge/Supabase-Backend-3ECF8E?logo=supabase)](https://supabase.com)
[![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?logo=dart)](https://dart.dev)
[![GitHub](https://img.shields.io/badge/GitHub-Workflow-181717?logo=github)](https://github.com)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

> Building a digital bridge between parents, educators, and daycare administrators — one scan at a time.

</div>

---

## 📖 Table of Contents
- [About the Project](#about-the-project)
- [Phase 1 MVP Scope](#phase-1-mvp-scope)
- [Tech Stack](#tech-stack)
- [Database Schema](#database-schema)
- [Project Structure](#project-structure)
- [Team Organization](#team-organization)
- [Getting Started](#getting-started)
- [Git Workflow](#git-workflow)
- [8-Week Roadmap](#8-week-roadmap)
- [Contributing](#contributing)
- [License](#license)

---

## 🌟 About the Project

**TinySteps** is a mobile-first daycare management app targeting early childhood care for children ages **0-5 years**. It empowers parents, teachers, and administrators with digital tools to streamline daily operations, ensure child safety, and improve communication.

This project is developed as part of an internship program, built collaboratively by a team of 20+ interns under structured squad-based mentorship.

### 🎯 Target Users
| Role | Responsibilities in App |
|------|------------------------|
| **Parent** | Register child, view attendance, manage profile |
| **Teacher/Staff** | Scan QR codes for child check-in/check-out |
| **Admin** | Approve staff, monitor attendance, manage classrooms |

---

## ✅ Phase 1 MVP Scope

> **Phase 1 focuses exclusively on these 4 modules. No out-of-scope features will be added.**

### Module A — Authentication & Role-Based Access
- Email/password registration with mandatory email verification
- Intelligent role routing: Parent → Parent Dashboard, Teacher → Teacher Dashboard, Admin → Admin Panel
- Supabase Auth with user metadata for role storage

### Module B — Child Digital Profiles
- Parents can add, edit, and view child profiles
- Fields: Name, date of birth, blood type, allergies, emergency contacts, pediatrician info
- Photo upload via device camera or gallery

### Module C — QR Touchless Attendance
- Parent generates a unique QR code per child
- Teacher scans QR code at drop-off and pick-up
- Timestamps logged automatically to database
- Parent can view full attendance history

### Module D — Admin Control Panel
- View all registered users (parents, teachers)
- Approve or reject staff account applications
- View real-time daily attendance summary
- Manage classroom assignments

---

## 🛠️ Tech Stack

| Layer | Technology | Purpose |
|-------|-----------|---------|
| **Frontend** | Flutter 3.x (Dart) | Cross-platform mobile app (Android + iOS) |
| **State Management** | Provider / Riverpod | Lightweight, beginner-friendly state management |
| **Backend** | Supabase | Managed Postgres DB, Auth, Storage, Realtime |
| **Database** | PostgreSQL (via Supabase) | Relational data storage with Row Level Security |
| **Storage** | Supabase Storage | Child photos, documents |
| **QR Library** | `qr_flutter` + `mobile_scanner` | QR generation and scanning |
| **Navigation** | Go Router | Declarative routing with role-based guards |
| **Version Control** | Git + GitHub | Collaboration, PR reviews, branch protection |
| **CI/CD** | GitHub Actions | Lint checks on PRs |
| **Design** | Figma | UI/UX wireframes and design system |

---

## 🗄️ Database Schema

```sql
-- User profiles (linked to Supabase Auth)
profiles (
  id UUID PRIMARY KEY,       -- matches auth.users.id
  full_name TEXT,
  role TEXT,                 -- 'parent' | 'teacher' | 'admin'
  avatar_url TEXT,
  is_approved BOOLEAN,       -- for teacher/staff accounts
  created_at TIMESTAMPTZ
)

-- Children registered by parents
children (
  id UUID PRIMARY KEY,
  parent_id UUID REFERENCES profiles(id),
  name TEXT,
  dob DATE,
  blood_type TEXT,
  allergies TEXT[],
  qr_code_data TEXT,         -- unique string for QR generation
  photo_url TEXT,
  emergency_contact TEXT,
  created_at TIMESTAMPTZ
)

-- Attendance logs
attendance (
  id UUID PRIMARY KEY,
  child_id UUID REFERENCES children(id),
  scanned_by UUID REFERENCES profiles(id),  -- teacher ID
  action TEXT,               -- 'check_in' | 'check_out'
  timestamp TIMESTAMPTZ,
  notes TEXT
)

-- Classrooms
classrooms (
  id UUID PRIMARY KEY,
  name TEXT,
  teacher_id UUID REFERENCES profiles(id),
  age_group TEXT             -- '0-1' | '1-3' | '3-5'
)
```

> ⚠️ **Note:** Row Level Security (RLS) policies are managed exclusively by the Project Handler. Interns should NOT modify RLS configurations.

---

## 📁 Project Structure

```
lib/
├── core/
│   ├── constants/       # App colors, text styles, dimensions
│   ├── services/        # Supabase client, storage service
│   ├── router/          # GoRouter configuration + role guards
│   └── widgets/         # Shared reusable widgets
├── features/
│   ├── auth/            # Login, Register, Email verification screens
│   ├── parent/          # Parent home, child profile, QR display
│   ├── teacher/         # Teacher home, QR scanner, attendance log
│   └── admin/           # Admin panel, user management
└── main.dart            # App entry point
```

---

## 👥 Team Organization

| Squad | Members | Module |
|-------|---------|--------|
| **Auth & Core Squad** | 4 interns | Module A — Authentication, routing, theme |
| **Child Profiles Squad** | 4 interns | Module B — Child CRUD, photo upload |
| **Attendance / QR Squad** | 4 interns | Module C — QR generation, scanning, history |
| **Admin Dashboard Squad** | 3 interns | Module D — Admin panel, user approvals |
| **UI/UX Squad** | 3 interns | Design system, shared widgets, Figma |
| **QA & DevOps Squad** | 2 interns | Testing, GitHub reviews, CI |

### Communication
- **Daily Standup:** 15 minutes — What did you do? What will you do? Blockers?
- **Squad Leads:** Each squad has 1 designated lead for first-level debugging
- **Project Handler:** Reviews all PRs to `main`, owns database schema and RLS

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK 3.x ([Install Guide](https://flutter.dev/docs/get-started/install))
- Dart 3.x (included with Flutter)
- Android Studio or VS Code with Flutter extension
- Git
- A Supabase account (free tier)

### Setup

1. **Clone the repository**
   ```bash
   git clone https://github.com/your-org/tinysteps-daycare.git
   cd tinysteps-daycare
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure environment variables**
   ```bash
   # Copy the example env file
   cp .env.example .env
   ```
   Fill in your Supabase credentials in `.env`:
   ```env
   SUPABASE_URL=https://your-project-ref.supabase.co
   SUPABASE_ANON_KEY=your-anon-key-here
   ```
   > ⚠️ NEVER commit `.env` to GitHub. It is already in `.gitignore`.

4. **Run the app**
   ```bash
   flutter run
   ```

---

## 🌿 Git Workflow

We follow a **Feature Branch Workflow**. All work happens on feature branches. No direct commits to `main`.

```
main                 ← Protected. Only Project Handler merges here.
  └── develop        ← Integration branch for squad work
        ├── feat/auth-login-screen
        ├── feat/child-profile-form
        ├── feat/qr-scanner
        └── fix/attendance-timestamp-bug
```

### Step-by-Step Contribution
```bash
# 1. Always start from the latest develop branch
git checkout develop
git pull origin develop

# 2. Create your feature branch
git checkout -b feat/your-feature-name

# 3. Make your changes, commit often
git add .
git commit -m "feat: add child profile form validation"

# 4. Push your branch
git push origin feat/your-feature-name

# 5. Open a Pull Request to develop on GitHub
# Request review from your Squad Lead
```

### Commit Message Format
```
feat: add new feature
fix: resolve bug
chore: update dependencies
docs: update README
style: format code
refactor: restructure module
test: add widget tests
```

---

## 📅 8-Week Development Roadmap

```
Week 1  ▓░░░░░░░  Setup & Onboarding
         Git training, Flutter env setup, Supabase config, Figma wireframes

Week 2  ██░░░░░░  Authentication
         Login, Register, Email verify, Role-based routing

Week 3  ███░░░░░  Child Profiles (Part 1)
         Database schema, Add Child form, View Child profile

Week 4  ████░░░░  Child Profiles (Part 2)
         Photo upload, Edit profile, Navigation polish

Week 5  █████░░░  QR Attendance (Part 1)
         QR code generation, Scanner UI, Camera permissions

Week 6  ██████░░  QR Attendance (Part 2)
         Scan logs to DB, Attendance history screen, Edge cases

Week 7  ███████░  Admin Panel
         User list, Staff approval flow, Daily attendance summary

Week 8  ████████  Polish & Demo
         Bug fixes, UI polish, Testing, APK build, Demo video
```

---

## 🤝 Contributing

1. Read the [Git Workflow](#git-workflow) section before writing any code
2. Pick an issue from GitHub Projects (no ticket = no work)
3. Work only on your assigned squad's module
4. Every PR requires at least 1 review before merging
5. All secrets go in `.env` — never hardcode credentials
6. Ask your Squad Lead before asking the Project Handler

---

## 🚫 Out of Scope (Phase 1)

The following features are planned for **future phases** and will NOT be implemented in Phase 1:

- CCTV / live video streaming
- Biometric attendance hardware integration
- IoT environmental monitoring (AQI, temperature)
- AI-powered food and nutrition recommendations
- Push notifications / emergency alerts
- Pediatrician portal / telemedicine

---

## 📜 License

This project is licensed under the MIT License. See [LICENSE](LICENSE) for details.

---

<div align="center">

**Built with ❤️ by 20+ interns | Internship Program 2026**

</div>
]]>
