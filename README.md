# Sanrı

Sanrı means hallucination, delusion in turkish. It is an alarm clock that will
simply wake you up.

> [!Important]
>
> This project is on planning stage. Not all the features are implemented yet.

## Design

1. Rust
2. Minimal as possible. Not bloated.
3. Interactive. Interacting with someone whom is about to sleep is pretty hard
   but need some way to wake myself up.

## How?

### Modes

#### Paragraph Mode

Write a paragraph correctly to shut the alarm off. No error is shown so be
careful.

#### QRCode Mode

Scan your code to shut the alarm off.

#### Sun Mode

Bright Flashlight. Not dimmable!

#### Killer Mode

No way to shut your alarm down! You can configure it to be more tolerant though.
Like no other way than writing this paragraph. So shutting your phone up won't
work this time!

#### Multi Mode

Combine other modes in order. You'll write a paragraph at first, then scan the
QR Code, then listen the ugliest sounds for five minutes etc. Who would survive
that? If one whom survives, deserves a good night sleep as a guy whom survives
is sleepy a lot!

### Extensions

I may allow people to script their own way of "waking up". It may easily become
a bloat, so be coutious. As scripting language, I don't know anything better
than lua. It does it's job and embraced among devs.

Here are some ideas that are planned to get implemented. But not sure whether as
a plugin or not.

#### Turn on the lights!

Using computer vision to determine whether the lights are on or off. You open
the lights on and wait for a preset duration.

#### GPT Alarm

You need to chat with chatgpt for a period. If you don't, punishment is coming!
(probably some kind of voice). Also your phrases should make sense and feel like
someone awake. If not, the period is reset and you should start from the
beggining.

#### Wash Your Face

Using AI to determine does your picture proof that your face is wet or not. Take
the pic closely.

## Notes

### Permissions

I think such software would require some suspicious permissions that a user
wouldn't give mindlessly (or at least shouldn't). So It's FOSS.
