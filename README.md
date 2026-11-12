# Trader Dashboard

A simple dashboard for US stocks that runs on your own computer, in your web browser.
It scans for setups, shows the news and company earnings, tracks your portfolio,
replays a trade 10,000 times before you risk money, checks every trade against
your own limits, and argues the bull and bear case for any stock.

Works on **Windows 10/11** and **macOS**. Free. No account and no API key needed.

> Education and tooling, not financial advice. Prices are free delayed quotes.
> Day trading loses most people money. Paper trading (practice money) is on by default.

---

## What you need

| | Needed? | What it's for |
|---|---|---|
| **Windows 10/11** or **macOS 11+** | Yes | Linux also works (see the end) |
| **Python 3.9 or newer** | Yes | Runs the dashboard. Free, 2-minute install (step 1) |
| **Internet connection** | Yes | Prices, news and filings come from Yahoo Finance, SEC EDGAR, Nasdaq and the House Clerk |
| A modern browser | Yes | Chrome, Edge, Safari or Firefox |
| **Claude Code** | Optional | Only for the **Bull vs Bear** page (step 4) |
| **Alpaca** account | Optional | Sync your positions and send approved **paper** orders (step 5) |
| PDF reader (Poppler) | Optional | Reads Congress filings into rows. One click in Settings |

Nothing else to install: no packages, no database, no sign-ups.

---

## Quick start (about 5 minutes)

### Step 1 · Install Python (once)

Already have it? Skip this step; the start file checks for you.

- **Windows:** go to <https://www.python.org/downloads/>, run the installer, and
  **tick "Add python.exe to PATH"** on the first screen before clicking *Install Now*.
- **Mac:** go to <https://www.python.org/downloads/> and run the installer.

### Step 2 · Start the dashboard

Unzip the folder anywhere (Desktop or Documents is fine), open it, and double-click:

- **Windows:** `Start (Windows)`
- **Mac:** `Start (Mac)`

Your browser opens the dashboard. A small window also opens: **keep it open** while
you use the dashboard, and close it when you're done.

**The first time only:**
- **Windows** may show *"Windows protected your PC"*: click **More info → Run anyway**.
- **Mac** may say it *"cannot be opened"*: **right-click** the file → **Open** → **Open**.
  If it says *"Permission denied"*, see Troubleshooting below.

### Step 3 · Fill in Settings (2 minutes)

Click **Settings** in the left menu. A red number shows how many things are left.

1. **Who is asking (for the SEC):** type your name and email, then click **Save**.
   The SEC requires this to download company filings. It is sent only to sec.gov.
2. **My money and limits:** set your trading budget, *max loss per trade* and
   *max loss per day*, then click **Save my limits**.
3. **My Portfolio → Add my holdings:** enter your US stocks (ticker, shares, average
   price paid) and your cash.
4. **Watchlist:** type the tickers you follow (e.g. `AAPL, MSFT, KO`) and click **Add**.

That's it. Every page now works, except Bull vs Bear, which needs step 4.

### Step 4 · Bull vs Bear (optional)

This page uses Claude to argue both sides from the facts the dashboard collects.

1. Install Claude Code: <https://claude.com/claude-code> (follow the install for your system).
2. Open it once and sign in with your Claude account.
3. Restart the dashboard. Settings will show *"Claude is available"*.

### Step 5 · Connect Alpaca (optional)

1. Create a free account at <https://alpaca.markets> and open **Paper Trading**.
2. Generate **API Keys** and copy the *Key ID* and *Secret Key*.
3. In the dashboard: **Settings → Alpaca → Connect**, then **My Portfolio → Sync from Alpaca**.

The dashboard only ever sends **paper** (practice) orders, and only after you type
**yes** for that one order.

---

## Everyday use

| When (New York time) | Page | What to do |
|---|---|---|
| Before 9:30 AM | **Find Setups** → *Daily setups* | See which charts look interesting today |
| Before 9:30 AM | **News** | Morning briefing for your stocks |
| Any time | **Earnings**, **Bull vs Bear**, **Congress Trades** | Research a stock |
| Any time | **Time Machine** | "What if I buy here?": the odds over 10,000 replays |
| After 9:50 AM | **Find Setups** → *Opening-range breakout* | Today's breakouts |
| After 9:50 AM | **Plan a Trade** | 6 steps: signal → stop & target → replay → size → risk check → approve |
| While trading | **Alerts** | Price, stop, target, % move or time alerts (turn on notifications) |

Every page has buttons, so there's nothing to type except tickers and numbers.

---

## Your data

- Everything is saved **on your computer**, in the `trader` folder inside this folder.
- **Closing the window does not lose data.** Your watchlist, portfolio, limits, alerts,
  trade plan and approvals are all there next time.
- While the dashboard is closed, **alerts are not checked**.
- **Moving to another computer:** copy the whole `TraderDashboard` folder.
- **Starting fresh:** close the dashboard and delete the `trader` folder.
- `trader/secrets.json` holds your Alpaca keys. **Don't share it**, and leave it out if
  you pass the folder on to someone else.

---

## Troubleshooting

| Problem | Fix |
|---|---|
| *"Python 3.9 or newer is needed"* | Do step 1. On Windows, re-run the Python installer, choose *Modify*, and tick *Add Python to environment variables*. |
| Mac: *"Permission denied"* or nothing happens | Open **Terminal**, type `chmod +x ` (with a space), drag `Start (Mac)` into the window, press Return. Then double-click again. |
| The page says *"The dashboard is not running"* | You closed the small window. Double-click the Start file again. |
| Earnings or SEC filings say *"needs your name and email"* | Settings → *Who is asking*. |
| A scan or the risk check says *"market is closed"* | Normal outside 9:30 AM–4:00 PM New York time, on weekends and on US market holidays. |
| Bull vs Bear is greyed out | Do step 4, then restart the dashboard. |
| Port already in use | Nothing to do: the dashboard picks the next free port automatically. |
| Something else | Close the small window, double-click Start again, and refresh the browser page. |

---

## Linux

```sh
./start-linux.sh            # then open http://127.0.0.1:8765
```

---

## Credits and licence

The dashboard itself (`app/server.py`, `app/index.html` and the start files) is
MIT-licensed; see `LICENSE`.

The 11 trading tools in `app/skills` are the open-source
[day-trader-skill](https://github.com/Jakeschincariol/day-trader-skill) project by
Jake Schincariol, MIT licence (`app/skills/LICENSE`). The dashboard runs them unchanged.

| Page | Tool |
|---|---|
| Find Setups | trader-scanner |
| News | trader-news |
| Earnings | trader-analyst |
| Congress Trades | trader-pelosi |
| Time Machine | trader-timemachine |
| Alerts | trader-alerts |
| Plan a Trade | trader-entry, trader-exit, trader-timemachine, trader-budget, trader-risk, trader-broker |
| Bull vs Bear | facts from the tools above, written up by Claude |

The dashboard only listens on your own computer (`127.0.0.1`); other computers and
other websites can't reach it.
