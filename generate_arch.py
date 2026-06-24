import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from matplotlib.patches import FancyBboxPatch

W, H = 20, 14
fig, ax = plt.subplots(figsize=(W, H))
ax.set_xlim(0, W)
ax.set_ylim(0, H)
ax.axis('off')
fig.patch.set_facecolor('#0f172a')
ax.set_facecolor('#0f172a')

BG     = '#0f172a'
CARD   = '#1e293b'
BLUE   = '#38bdf8'
GREEN  = '#4ade80'
ORANGE = '#fb923c'
PURPLE = '#a78bfa'
YELLOW = '#fbbf24'
RED    = '#f87171'
WHITE  = '#f1f5f9'
MUTED  = '#64748b'
TEAL   = '#2dd4bf'

def box(x, y, w, h, fill=CARD, stroke=MUTED, lw=1.5, r=0.3, alpha=1.0, z=2):
    ax.add_patch(FancyBboxPatch((x, y), w, h,
                 boxstyle=f"round,pad=0,rounding_size={r}",
                 linewidth=lw, edgecolor=stroke, facecolor=fill,
                 alpha=alpha, zorder=z))

def txt(x, y, s, size=9, color=WHITE, bold=False, ha='center', z=10):
    ax.text(x, y, s, fontsize=size, color=color, ha=ha, va='center',
            fontweight='bold' if bold else 'normal', zorder=z,
            fontfamily='monospace')

def chip(cx, cy, label, color):
    w = len(label) * 0.115 + 0.28
    box(cx - w/2, cy - 0.165, w, 0.33, fill=color, stroke=color, lw=0, r=0.1, z=7)
    txt(cx, cy, label, size=7, color='#0f172a', bold=True, z=8)

def arrow(x1, y1, x2, y2, color=MUTED, lw=1.8):
    ax.annotate('', xy=(x2, y2), xytext=(x1, y1),
                arrowprops={'arrowstyle': '->', 'color': color, 'lw': lw,
                            'connectionstyle': 'arc3,rad=0.0'}, zorder=9)

# ── Title ─────────────────────────────────────────────────────
box(0, 13.25, W, 0.75, fill='#0c2040', stroke=BLUE, lw=0, r=0, z=1)
txt(W/2, 13.65, 'TerraFlex  —  Modular, Multi-Environment AWS Infrastructure', size=13, color=WHITE, bold=True)

# ════════════════════════════════════════════════════════════════
# LAYER 1  —  ./Infrastructure  (the reusable module)
# ════════════════════════════════════════════════════════════════
box(0.4, 9.9, 19.2, 3.1, fill='#12101f', stroke=PURPLE, lw=2, r=0.4, z=2)
txt(10, 12.75, './Infrastructure  —  One reusable module.  Enable any resource with a variable flag.',
    size=9.5, color=PURPLE, bold=True)

flags = [
    # Networking
    ('create_vpc',              TEAL),
    ('create_igw',              TEAL),
    ('create_route_tables',     TEAL),
    ('create_public_subnets',   TEAL),
    ('create_private_subnets',  TEAL),
    ('create_intra_subnets',    TEAL),
    ('peer_vpc_to',             YELLOW),
    # Compute & Security
    ('create_ec2',              BLUE),
    ('create_sg',               RED),
    ('create_ecs',              GREEN),
    ('create_ecr',              YELLOW),
    ('create_app_runner',       ORANGE),
    # Storage & Data
    ('create_s3_bucket',        BLUE),
    ('create_rds',              RED),
    # Load Balancing
    ('create_alb',              BLUE),
    ('enable_frontend_alb',     BLUE),
    ('enable_backend_alb',      BLUE),
    ('create_nlb',              TEAL),
    ('enable_https',            TEAL),
    # Other
    ('create_acm',              WHITE),
    ('create_amplify_app',      PURPLE),
    ('enable_monitoring',       BLUE),
    ('enable_remote_backend_state', PURPLE),
]
cols = 6
for i, (flag, color) in enumerate(flags):
    cx = 1.85 + (i % cols) * 2.75
    cy = 12.15 - (i // cols) * 0.55
    box(cx - 1.3, cy - 0.21, 2.6, 0.42, fill='#1e293b', stroke=color, lw=1, r=0.12, z=4)
    txt(cx, cy, flag, size=7, color=color, z=5)

txt(10, 10.12, 'Dependencies auto-inferred  —  enabling EC2 also enables VPC, SG, Key Pair, Monitoring',
    size=7.5, color=MUTED)

# ════════════════════════════════════════════════════════════════
# LAYER 2  —  Environments (Main.tf calls)
# ════════════════════════════════════════════════════════════════
box(0.4, 5.5, 19.2, 4.1, fill='#111827', stroke=MUTED, lw=1.5, r=0.4, z=2)
txt(10, 9.35, 'Main.tf  —  Call the same module for each environment  (or any resource group)',
    size=9.5, color=WHITE, bold=True)

# ENV columns
envs = [
    ('dev',     GREEN,  'create_vpc    = true\ncreate_ec2    = true',           'Lightweight\nfor development'),
    ('staging', YELLOW, 'create_ec2    = true\ncreate_ecs    = true\ncreate_alb    = true', 'Mirrors prod\nfor testing'),
    ('prod',    ORANGE, 'create_ecs    = true\ncreate_rds    = true\ncreate_alb    = true\nenable_https  = true', 'Full stack\nfor production'),
    ('backend', PURPLE, 'enable_remote_\nbackend_state = true',                'S3 + DynamoDB\nstate storage'),
]
env_xs = [1.5, 6.0, 10.8, 15.6]

for (name, color, flags_txt, note), ex in zip(envs, env_xs):
    box(ex, 5.75, 3.8, 3.35, fill='#0c1520', stroke=color, lw=1.8, r=0.3, z=3)
    # env badge
    box(ex + 0.1, 8.7, 3.6, 0.3, fill=color, stroke=color, lw=0, r=0.1, z=4)
    txt(ex + 1.9, 8.85, name, size=8.5, color='#0f172a', bold=True, z=5)
    # flags
    for j, line in enumerate(flags_txt.split('\n')):
        txt(ex + 1.9, 8.3 - j * 0.42, line, size=7.5, color=MUTED, z=5)
    # note
    box(ex + 0.1, 5.9, 3.6, 0.55, fill='#1e293b', stroke=color, lw=0.8, r=0.15, z=4)
    for j, line in enumerate(note.split('\n')):
        txt(ex + 1.9, 6.25 - j * 0.28, line, size=7, color=color, z=5)

# ════════════════════════════════════════════════════════════════
# LAYER 3  —  AWS Resources
# ════════════════════════════════════════════════════════════════
box(0.4, 0.3, 19.2, 4.9, fill='#0c1520', stroke=MUTED, lw=1.5, r=0.4, z=2)
txt(10, 4.95, 'AWS  —  Resources provisioned per environment', size=9.5, color=MUTED, bold=True)

res = [
    (GREEN,  'dev',     ['VPC', 'EC2', 'SG', 'IGW'],                      '192.168.0.0/22'),
    (YELLOW, 'staging', ['VPC', 'EC2', 'ECS', 'ALB', 'SG'],               '10.0.0.0/16'),
    (ORANGE, 'prod',    ['VPC', 'ECS', 'RDS', 'ALB', 'ACM', 'ECR', 'SG'], '10.1.0.0/16'),
    (PURPLE, 'backend', ['S3', 'DynamoDB'],                                'State storage'),
]
res_xs = [0.7, 5.4, 10.1, 15.2]

for (color, name, services, note), rx in zip(res, res_xs):
    box(rx, 0.5, 4.1, 4.1, fill='#111827', stroke=color, lw=1.5, r=0.3, z=3)
    txt(rx + 2.05, 4.35, name, size=9, color=color, bold=True, z=5)
    txt(rx + 2.05, 4.0, note, size=7, color=MUTED, z=5)
    # service chips in a grid
    for j, svc in enumerate(services):
        cx = rx + 0.9 + (j % 3) * 1.35
        cy = 3.4 - (j // 3) * 0.65
        chip(cx, cy, svc, color)
    # VPC peering badge between dev and staging
    if name == 'prod':
        box(rx, 1.1, 4.1, 0.55, fill='#1e293b', stroke=color, lw=0.8, r=0.15, z=4)
        txt(rx + 2.05, 1.38, 'peer_vpc_to  =  staging VPC ID', size=7, color=MUTED, z=5)

# peering arrow between dev and staging
ax.annotate('', xy=(5.35, 2.8), xytext=(4.8, 2.8),
            arrowprops={'arrowstyle': '<->', 'color': YELLOW, 'lw': 1.5,
                        'connectionstyle': 'arc3,rad=0.0'}, zorder=9)
txt(5.08, 3.1, 'VPC\nPeering', size=6.5, color=YELLOW, z=10)

# ── Arrows between layers ─────────────────────────────────────
# Module -> Environments
for ex, (_, color, _, _) in zip(env_xs, envs):
    arrow(ex + 1.9, 9.9, ex + 1.9, 9.1, color=color, lw=1.8)

# Environments -> Resources
for (ex, (_, ec, _, _)), (rx, (rc, _, _, _)) in zip(
        zip(env_xs, envs), zip(res_xs, res)):
    arrow(ex + 1.9, 5.75, rx + 2.05, 4.6, color=ec, lw=1.8)

plt.tight_layout(pad=0)
out = r'c:\Users\barla.surya.t.reddy\.vscode\Projects\TerraFlex\architecture.png'
plt.savefig(out, dpi=180, bbox_inches='tight', facecolor=BG, edgecolor='none')
plt.close()
print(f'Saved: {out}')
