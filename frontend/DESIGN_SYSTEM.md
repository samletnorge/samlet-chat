# Samlet Chat - Modern Design System

## Overview

The design system has been modernized with inspiration from shadcn/ui and Vercel's design principles. The color palette is clean, professional, and centered around the primary brand color (FFD700 - Gold).

## Color Palette

### Primary Color (Gold - FFD700)
Used for main CTAs, links, and interactive elements.
```scss
$primary:           #ffd700;      // Main brand color
$primary-50:        #fffbeb;      // Lightest
$primary-100:       #fef3c7;
$primary-200:       #fde68a;
$primary-300:       #fcd34d;
$primary-400:       #fbbf24;
$primary-500:       #f59e0b;
$primary-600:       #d97706;
$primary-700:       #b45309;
$primary-800:       #92400e;
$primary-900:       #78350f;      // Darkest
$primary-text:      #1f2937;      // Text on primary background
```

### Secondary (Neutral/Slate)
Used for text, borders, and supporting UI elements.
```scss
$secondary:           #0f172a;
$secondary-light:     #64748b;
$secondary-lighter:   #cbd5e1;
$secondary-text:      #ffffff;

// Full neutral scale
$neutral-50:          #f9fafb;
$neutral-100:         #f3f4f6;
$neutral-200:         #e5e7eb;
$neutral-300:         #d1d5db;
$neutral-400:         #9ca3af;
$neutral-500:         #6b7280;
$neutral-600:         #4b5563;
$neutral-700:         #374151;
$neutral-800:         #1f2937;
$neutral-900:         #111827;
```

### Semantic Colors

#### Success (Green)
Used for positive actions, approvals, and success messages.
```scss
$success:             #16a34a;
$success-text:        #15803d;
$success-50:          #f0fdf4;
$success-100:         #dcfce7;
$success-200:         #bbf7d0;
$success-300:         #86efac;
$success-400:         #4ade80;
$success-500:         #22c55e;
$success-600:         #16a34a;
$success-700:         #15803d;
$success-800:         #166534;
$success-900:         #145231;
```

#### Warning (Orange)
Used for warnings, pending actions, and cautions.
```scss
$warning:             #ea580c;
$warning-text:        #7c2d12;
$warning-50:          #fff7ed;
$warning-100:         #feed7d;
$warning-200:         #fcd34d;
$warning-300:         #fbbf24;
$warning-400:         #f59e0b;
$warning-500:         #f97316;
$warning-600:         #ea580c;
$warning-700:         #c2410c;
$warning-800:         #9a3412;
$warning-900:         #7c2d12;
```

#### Destructive/Error (Red)
Used for dangerous actions, errors, and deletions.
```scss
$destructive:         #dc2626;
$destructive-text:    #7f1d1d;
$destructive-50:      #fef2f2;
$destructive-100:     #fee2e2;
$destructive-200:     #fecaca;
$destructive-300:     #fca5a5;
$destructive-400:     #f87171;
$destructive-500:     #ef4444;
$destructive-600:     #dc2626;
$destructive-700:     #b91c1c;
$destructive-800:     #991b1b;
$destructive-900:     #7f1d1d;
```

#### Info (Blue)
Used for informational messages and content.
```scss
$info:                #2563eb;
$info-text:           #1e3a8a;
$info-50:             #eff6ff;
$info-100:            #dbeafe;
$info-200:            #bfdbfe;
$info-300:            #93c5fd;
$info-400:            #60a5fa;
$info-500:            #3b82f6;
$info-600:            #2563eb;
$info-700:            #1d4ed8;
$info-800:            #1e40af;
$info-900:            #1e3a8a;
```

#### Accent (Cyan)
Complementary accent color for special UI elements.
```scss
$accent:              #06b6d4;
$accent-light:        #22d3ee;
$accent-50:           #ecf0f1;
```

## Text Colors

Semantic text color variables for consistent typography:

```scss
$text-primary:        $neutral-900;    // Main text (#111827)
$text-secondary:      $neutral-600;    // Secondary text (#4b5563)
$text-tertiary:       $neutral-500;    // Tertiary text (#6b7280)
$text-inverse:        $white;          // Text on dark backgrounds
$text-muted:          $neutral-400;    // Muted/disabled text (#9ca3af)
```

## Background Colors

```scss
$bg-primary:          $white;           // Main background
$bg-secondary:        $neutral-50;      // Secondary background
$bg-tertiary:         $neutral-100;     // Tertiary background
```

## Usage Examples

### Buttons

**Primary Button (CTA)**
```scss
.button.primary {
  background: $primary;
  color: $primary-text;
  border: none;
  
  &:hover {
    background: $primary-600;
  }
}
```

**Destructive Button**
```scss
.button.destructive {
  color: $destructive;
  border: 1px solid $destructive-200;
  background: transparent;
  
  &:hover {
    background: $destructive-50;
  }
}
```

### Inputs & Forms

**Text Input**
```scss
input[type=text],
textarea {
  background: $bg-primary;
  border: 1px solid $neutral-300;
  color: $text-primary;
  
  &::placeholder {
    color: $text-muted;
  }
  
  &:focus {
    border-color: $primary;
    box-shadow: 0 0 0 3px rgba(255, 215, 0, 0.1);
  }
}
```

### Cards & Containers

```scss
.card {
  background: $bg-primary;
  border: 1px solid $neutral-200;
  border-radius: 8px;
  
  &:hover {
    border-color: $neutral-300;
    box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);
  }
}
```

### Status Messages

**Error Message**
```scss
.error {
  background: $destructive-50;
  color: $destructive-text;
  border: 1px solid $destructive-200;
  border-radius: 6px;
}
```

**Success Message**
```scss
.success {
  background: $success-50;
  color: $success-text;
  border: 1px solid $success-200;
  border-radius: 6px;
}
```

**Warning Message**
```scss
.warning {
  background: $warning-50;
  color: $warning-text;
  border: 1px solid $warning-200;
  border-radius: 6px;
}
```

## Design Principles

1. **Minimalism**: Clean, uncluttered interfaces with clear hierarchy
2. **Consistency**: Reusable patterns and components across the platform
3. **Accessibility**: Sufficient color contrast, clear interactive states
4. **Modern**: Rounded corners (6-8px), subtle shadows, smooth transitions
5. **Professionalism**: Limited color palette, intentional use of color for meaning

## Transitions & Interactions

All interactive elements should have smooth transitions:

```scss
transition: all 0.2s ease;  // Standard transition
transition: color 0.2s ease; // For simple color changes
transition: background 0.15s ease; // For background changes
```

## Border Radius

Use consistent border radius values:
- Small elements: `4px` (badges, small inputs)
- Medium elements: `6px` (buttons, cards, modals)
- Large elements: `8px` (containers, section separators)

## Shadows

Use subtle shadows for depth:
```scss
// Subtle shadow
box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05);

// Standard shadow  
box-shadow: 0 1px 3px rgba(0, 0, 0, 0.1);

// Medium shadow
box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1);

// Large shadow (modals)
box-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.2);
```

## Backward Compatibility

The old color variables (e.g., `$gray-0` through `$gray-9`, `$blue-0` through `$blue-9`) are still available and mapped to the new color system for backward compatibility. Prefer using the new semantic color variables in new code.
