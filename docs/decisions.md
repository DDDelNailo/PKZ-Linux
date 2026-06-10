# Architectural Decisions

## ADR-001: Base Distribution

Decision:
Use Arch Linux as the foundation.

Reasoning:

* Excellent documentation.
* Minimal starting point.
* Large package ecosystem.
* Strong understanding of system internals.

Tradeoffs:

* Rolling release updates.
* Requires more maintenance than fixed-release distributions.

Status:
Accepted.

## ADR-002: Installation Approach

Decision:
Perform manual installation without archinstall.

Reasoning:

* Learn every installation step.
* Understand the purpose of each component.
* Avoid hidden configuration decisions.

Tradeoffs:

* Slower setup process.
* More opportunities for mistakes.

Status:
Accepted.

## ADR-003: Desktop Environment

Decision:
Use Hyprland.

Reasoning:

* Existing familiarity.
* Wayland support.
* Flexible configuration.
* Lightweight.

Tradeoffs:

* More manual configuration than traditional desktop environments.

Status:
Accepted.

## ADR-004: Hardware Target

Decision:
Primary target is an Intel graphics laptop.

Reasoning:

* Matches development hardware.
* Simpler graphics stack.
* Good Linux compatibility.

Status:
Accepted.
