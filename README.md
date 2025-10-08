# composition-based-practice-1
Making a game with composition design principle.

https://rokametism.github.io/Composition-Based-Practice-1/

## Collision Layers
Player : Layer 1 Mask 2?
player's collision area is used for hurtbox only.
Enemy : Layer 2 Mask 1
enemy's collision area is used for both hurtbox and hitbox.
Projectile (by player) : Layer 3 Mask 2
projectile's collision area is used for hitbox only.
XPdrop : Layer 4 Mask 1
check if it actually touches the player.
PlayerCollectionArea : Layer 5(?) Mask 4
used for collecting things like XPdrop. Pulls things like magnet.

Todo : seperate every hitbox and hurtbox into sibling Area2D nodes.
🎮 Player Scene Example
Player (CharacterBody2D)
├── Sprite2D                # visual
├── CollisionShape2D        # physics movement
├── Hurtbox (Area2D)        # player takes damage here
│   └── CollisionShape2D
├── Hitbox (Area2D)         # player melee attack area
│   └── CollisionShape2D
└── ProjectileSpawn (Node2D) # marker for bullets

Setup

Player Hurtbox

Layer: 1

Mask: 5 (enemy hitboxes)

Player Hitbox

Layer: 4

Mask: 2 (enemy hurtboxes)

Disabled by default — enable only during attack animation frames.

ProjectileSpawn

Used to instance projectile scenes on attack.

👾 Enemy Scene Example
Enemy (CharacterBody2D)
├── Sprite2D
├── CollisionShape2D        # movement
├── Hurtbox (Area2D)        # enemy takes damage here
│   └── CollisionShape2D
└── Hitbox (Area2D)         # enemy’s attack area
    └── CollisionShape2D

Setup

Enemy Hurtbox

Layer: 2

Mask: 4,3 (player hitboxes + projectiles)

Enemy Hitbox

Layer: 5

Mask: 1 (player hurtbox)

Disabled until the enemy is actively attacking.

🎯 Example Signal Wiring
Player.gd
extends CharacterBody2D

@onready var hurtbox: Area2D = $Hurtbox
@onready var hitbox: Area2D = $Hitbox

func _ready():
    # Take damage from enemy hitboxes
    hurtbox.body_entered.connect(_on_hurtbox_hit)
    # Deal damage to enemies
    hitbox.body_entered.connect(_on_hitbox_connect)
    hitbox.monitoring = false  # disabled unless attacking

func attack():
    hitbox.monitoring = true   # enable hitbox temporarily
    await get_tree().create_timer(0.2).timeout
    hitbox.monitoring = false

func _on_hurtbox_hit(body):
    if body.is_in_group("EnemyHitbox"):
        print("Player took damage from enemy")

func _on_hitbox_connect(body):
    if body.is_in_group("EnemyHurtbox"):
        print("Enemy hit!")

Enemy.gd
extends CharacterBody2D

@onready var hurtbox: Area2D = $Hurtbox
@onready var hitbox: Area2D = $Hitbox

func _ready():
    hurtbox.body_entered.connect(_on_hurtbox_hit)
    hitbox.body_entered.connect(_on_hitbox_connect)
    hitbox.monitoring = false

func attack():
    hitbox.monitoring = true
    await get_tree().create_timer(0.3).timeout
    hitbox.monitoring = false

func _on_hurtbox_hit(body):
    if body.is_in_group("PlayerHitbox") or body.is_in_group("Projectile"):
        print("Enemy got hit!")

func _on_hitbox_connect(body):
    if body.is_in_group("PlayerHurtbox"):
        print("Enemy damaged player!")

📌 Summary

Hurtbox = receives damage. Passive, always on.

Hitbox = deals damage. Only enabled during active attack frames.

Each has its own Area2D node + CollisionShape2D.

Separation gives you precise control and avoids “always attacking” issues.

Groups (PlayerHitbox, EnemyHurtbox, etc.) make checks simpler.
