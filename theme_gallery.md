# 🎨 TinySteps — Theme Gallery
**Document type:** Design Reference for UI/UX Squad
**Generated:** 2026-03-12 | **Status:** Awaiting Project Handler Selection

---

## How to Choose
Rate each theme on: **Daycare feel · All-ages readability · Professionalism · Energy**

---

## 🌿 Theme 1 — "Meadow"
*Calming · Nature-inspired · Trust-building*

**Color Psychology:**
| Color | Hex | Why |
|---|---|---|
| Forest Green (Primary) | `#2D6A4F` | Safety, growth, nature — universally calming |
| Warm Amber (Accent) | `#F4A261` | Warmth, energy, optimism — friendly to all ages |
| Soft Mint (Background) | `#F0FFF4` | Light, airy, easy on eyes — low visual fatigue |
| White (Surface) | `#FFFFFF` | Cleanliness, trust |

**Best for:** Parents who value a calm, nature-connected feel. Feels like a safe, organic daycare environment.

**Login Screen:**
![Meadow Login](theme_meadow_login_1773257171966.png)

---

## ☁️ Theme 2 — "Skylight"
*Clean · Professional · Trustworthy*

**Color Psychology:**
| Color | Hex | Why |
|---|---|---|
| Sky Blue (Primary) | `#0077B6` | Trust, reliability, calm — most universally trusted color |
| Sunshine Yellow (Accent) | `#FFD166` | Happiness, optimism, child-friendly energy |
| Cloud White (Background) | `#F8FAFF` | Airy, professional, minimal eye strain |
| Deep Navy (Text) | `#03045E` | Authority, readability, strong contrast |

**Best for:** Teachers and admins who need a professional, clean interface. Parents trust it immediately.

**Login Screen:**
![Skylight Login](theme_skylight_login_1773257179880.png)

**Parent Dashboard (Skylight):**
![Skylight Parent Dashboard](theme_skylight_parent_dashboard_1773257199701.png)

---

## 🌅 Theme 3 — "Sunrise"
*Warm · Playful · Energetic*

**Color Psychology:**
| Color | Hex | Why |
|---|---|---|
| Soft Coral (Primary) | `#FF6B6B` | Warmth, excitement, child-friendly — stimulating without harsh red |
| Gentle Lavender (Secondary) | `#C77DFF` | Creativity, imagination, learning |
| Peach (Accent) | `#FFB347` | Friendliness, approachability, morning energy |
| Warm White (Background) | `#FFF9F5` | Soft, not harsh — warm feeling |

**Best for:** A more playful, energetic vibe that feels exciting every morning. Great for the "drop-off moment" UX.

**Login Screen:**
![Sunrise Login](theme_sunrise_login_1773257189905.png)

**Admin Dashboard (Sunrise):**
![Sunrise Admin Dashboard](theme_sunrise_admin_dashboard_1773257210768.png)

---

## Dark Mode Strategy (All Themes)
Each theme has dark mode equivalents. Dark mode is NOT just inverting colors — it uses:
- Deep dark backgrounds (`#0D1117` base)
- Reduced saturation versions of primary colors
- Surface cards in `#1C1C2E` (not pure black)
- Text in `#E8E8F0` (off-white, easier on eyes)
- Same accent colors at ~80% brightness

Dark mode can be toggled system-wide and persists per user preference stored in Supabase profile.

---

## 📐 Shared Design System (All Themes)
These stay consistent regardless of which theme is chosen:
- **Font:** Lexend (Google Fonts) — designed for readability for all ages including dyslexia
- **Border radius:** 16–24px everywhere (no sharp corners — feels safe and child-friendly)
- **Spacing:** 16px base grid
- **Button style:** Pill-shaped (full radius) for primary, outlined pill for secondary
- **Navigation:** Floating pill bottom nav bar
- **Icons:** Rounded Material Icons
- **Shadows:** Soft, low-opacity (not harsh) — 4px blur, 2px offset

---

## Recommendation
| Theme | Recommended for |
|---|---|
| 🌿 **Meadow** | If you want the app to feel organic, calm, like a premium nature-based daycare |
| ☁️ **Skylight** | If you want maximum professional trust — safest choice for institutional adoption |
| 🌅 **Sunrise** | If you want the most energetic, parent-friendly morning feel |

> **My suggestion:** Go with **Skylight** as the base theme — it's the most universally trusted and professional. The UI/UX squad can then add Meadow-inspired accents (soft greens) to warm it up for the daycare feel without sacrificing the clean lines.

---

## Next Steps for UI/UX Squad
1. Project handler picks one theme (or a mix)
2. UI/UX squad creates a full Figma design system from the chosen palette
3. Export color tokens, typography scale, and component specs to a `design_tokens.md` file
4. Frontend squad imports tokens into [lib/core/constants/app_theme.dart](file:///d:/Internship/project1/tinysteps/lib/core/constants/app_theme.dart)
5. Dark mode variants designed in Figma before any dark mode code is written
