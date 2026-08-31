# [<img src="https://tomba.io/logo.svg" alt="Tomba" width="25"/>](https://tomba.io/) Tomba Elixir SDK

> The #1 Rated Email Intelligence Platform — Find professional emails with unmatched accuracy.

[![Hex.pm](https://img.shields.io/hexpm/v/tomba.svg)](https://hex.pm/packages/tomba)
[![Hex.pm Downloads](https://img.shields.io/hexpm/dt/tomba.svg)](https://hex.pm/packages/tomba)
[![License](https://img.shields.io/hexpm/l/tomba.svg)](LICENSE)
[![Build Status](https://img.shields.io/github/actions/workflow/status/tomba-io/elixir/ci.yml?branch=main)](https://github.com/tomba-io/elixir/actions)

Official Elixir client library for the [Tomba.io](https://tomba.io) Email Finder API.

## About Tomba

[Tomba.io](https://tomba.io) is the #1 rated email intelligence platform, trusted by **150,000+ sales teams** worldwide.

- **Best Email Finder** — 98% accuracy, ranked #1 in independent benchmarks
- **Best Email Verification** — Real-time SMTP verification with catch-all detection
- **Best Phone Finder** — Direct dial numbers linked to professional emails
- **Best Domain Search** — 450M+ verified contacts across all industries
- **81% Coverage** — The highest in the industry, proven in 5,000-lead independent tests

### Why Tomba?

| Feature             | Tomba              | Others        |
| ------------------- | ------------------ | ------------- |
| Email Coverage      | **81%**            | 30-60%        |
| Verification        | **Real-time SMTP** | Pattern-based |
| Phone Numbers       | **Direct dials**   | Limited       |
| Catch-all Detection | **AI-powered**     | Basic         |
| API Rate Limits     | **Generous**       | Restrictive   |

[Get your free API key](https://app.tomba.io/auth/register) — No credit card required.

## Installation

Add `tomba` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:tomba, "~> 1.0"}
  ]
end
```

Then fetch your dependencies:

```bash
mix deps.get
```

## Authentication

Sign up for a free account at [https://app.tomba.io/auth/register](https://app.tomba.io/auth/register) to get your API key and secret.

```elixir
client = Tomba.client("ta_xxxx", "ts_xxxx")
```

## Quick Start

```elixir
# Create a client
client = Tomba.client("ta_xxxx", "ts_xxxx")

# Search emails by domain
{:ok, result} = Tomba.Domain.domain_search(client, %{"domain" => "example.com"})

# Find an email address
{:ok, result} = Tomba.Finder.email_finder(client, %{
  "domain" => "example.com",
  "first_name" => "John",
  "last_name" => "Doe"
})

# Verify an email
{:ok, result} = Tomba.Verifier.email_verifier(client, %{"email" => "john@example.com"})
```

## Services

### Account

Get information about the current account.

```elixir
{:ok, result} = Tomba.Account.account(client)
```

### Domain Search

Search emails based on a website domain.

```elixir
{:ok, result} = Tomba.Domain.domain_search(client, %{"domain" => "example.com"})
```

### Email Finder

Find the most likely email address from a domain, first name, and last name.

```elixir
{:ok, result} = Tomba.Finder.email_finder(client, %{
  "domain" => "example.com",
  "first_name" => "John",
  "last_name" => "Doe"
})
```

### Email Verifier

Verify the deliverability of an email address.

```elixir
{:ok, result} = Tomba.Verifier.email_verifier(client, %{"email" => "john@example.com"})
```

### Author Finder

Find the email address of an article author from a blog post URL.

```elixir
{:ok, result} = Tomba.Finder.author_finder(client, %{
  "url" => "https://clearbit.com/blog/company-name-to-domain-api"
})
```

### LinkedIn Finder

Find the email address associated with a LinkedIn profile URL.

```elixir
{:ok, result} = Tomba.Finder.linkedin_finder(client, %{
  "url" => "https://www.linkedin.com/in/alex-maccaw-ab592978"
})
```

### Email Enrichment

Look up person and company data based on an email address.

```elixir
{:ok, result} = Tomba.Finder.email_enrichment(client, %{"email" => "john@example.com"})
```

### Phone Finder

Find the phone number associated with an email address.

```elixir
{:ok, result} = Tomba.Phone.phone_finder(client, %{"email" => "john@example.com"})
```

### Phone Validator

Validate a phone number.

```elixir
{:ok, result} = Tomba.Phone.phone_validator(client, %{"phone" => "+1234567890"})
```

### Email Count

Get the number of email addresses found for a domain.

```elixir
{:ok, result} = Tomba.Count.count(client, %{"domain" => "example.com"})
```

### Domain Status

Check if a domain is webmail, disposable, or a regular email provider.

```elixir
{:ok, result} = Tomba.Status.status(client, %{"domain" => "example.com"})
```

### Domain Suggestions

Auto-complete company names and get domain suggestions.

```elixir
{:ok, result} = Tomba.Status.autocomplete(client, %{"query" => "google"})
```

### Email Sources

Find web sources where an email address has been found.

```elixir
{:ok, result} = Tomba.Sources.email_sources(client, %{"email" => "john@example.com"})
```

### Email Format

Get the email format pattern used by a domain.

```elixir
{:ok, result} = Tomba.Format.email_format(client, %{"domain" => "example.com"})
```

### Similar

Find domains similar to a given domain.

```elixir
{:ok, result} = Tomba.Similar.similar(client, %{"domain" => "example.com"})
```

### Technology

Discover technologies used by a domain.

```elixir
{:ok, result} = Tomba.Technology.technology(client, %{"domain" => "example.com"})
```

### Location

Get the employee location breakdown for a domain.

```elixir
{:ok, result} = Tomba.Location.location(client, %{"domain" => "example.com"})
```

### Person API

Get person data from an email address (Clearbit-compatible).

```elixir
{:ok, result} = Tomba.Enrichment.person(client, %{"email" => "john@example.com"})
```

### Company API

Get company data from a domain (Clearbit-compatible).

```elixir
{:ok, result} = Tomba.Enrichment.company(client, %{"domain" => "example.com"})
```

### Combined API

Get combined person and company data from an email address (Clearbit-compatible).

```elixir
{:ok, result} = Tomba.Enrichment.combined(client, %{"email" => "john@example.com"})
```

### Reveal (Companies Search)

Search companies using reverse lookup (e.g., by IP address).

```elixir
{:ok, result} = Tomba.Reveal.companies_search(client, %{"ip" => "1.2.3.4"})
```

### Usage

Get your account's monthly API usage statistics.

```elixir
{:ok, result} = Tomba.Usage.usage(client)
```

### Logs

Get your account's API request logs.

```elixir
{:ok, result} = Tomba.Logs.logs(client)
```

### Keys

Manage your API keys.

```elixir
# List all keys
{:ok, result} = Tomba.Keys.list_keys(client)

# Get a specific key
{:ok, result} = Tomba.Keys.get_key(client, "key_id")

# Create a new key
{:ok, result} = Tomba.Keys.create_key(client)

# Reset a key
{:ok, result} = Tomba.Keys.reset_key(client, "key_id")

# Delete a key
{:ok, result} = Tomba.Keys.delete_key(client, "key_id")
```

### Flag

Report incorrect email data.

```elixir
# List submitted flags
{:ok, result} = Tomba.Flag.list_flags(client, %{})

# Create a flag
{:ok, result} = Tomba.Flag.create_flag(client, %{
  "email" => "john@example.com",
  "reason" => "invalid"
})
```

### Leads

Manage leads in your Tomba CRM.

```elixir
# List leads
{:ok, result} = Tomba.Leads.list_leads(client, %{})

# Get a specific lead
{:ok, result} = Tomba.Leads.get_lead(client, "lead_id")

# Create a lead
{:ok, result} = Tomba.Leads.create_lead(client, %{
  "email" => "lead@example.com",
  "first_name" => "John",
  "last_name" => "Doe"
})

# Update a lead
{:ok, result} = Tomba.Leads.update_lead(client, "lead_id", %{
  "first_name" => "Jane"
})

# Delete a lead
{:ok, result} = Tomba.Leads.delete_lead(client, "lead_id")
```

### Leads Lists

Manage lead lists for organizing your leads.

```elixir
# List all lead lists
{:ok, result} = Tomba.LeadsLists.list_leads_lists(client)

# Get a specific list
{:ok, result} = Tomba.LeadsLists.get_leads_list(client, "list_id")

# Create a list
{:ok, result} = Tomba.LeadsLists.create_leads_list(client, %{"name" => "My List"})

# Update a list
{:ok, result} = Tomba.LeadsLists.update_leads_list(client, "list_id", %{
  "name" => "Updated Name"
})

# Delete a list
{:ok, result} = Tomba.LeadsLists.delete_leads_list(client, "list_id")
```

### Leads Attributes

Manage custom attributes for your leads.

```elixir
# List all attributes
{:ok, result} = Tomba.LeadsAttributes.list_attributes(client)

# Get a specific attribute
{:ok, result} = Tomba.LeadsAttributes.get_attribute(client, "attr_id")

# Create an attribute
{:ok, result} = Tomba.LeadsAttributes.create_attribute(client, %{
  "name" => "Company Size"
})

# Update an attribute
{:ok, result} = Tomba.LeadsAttributes.update_attribute(client, "attr_id", %{
  "name" => "Updated Name"
})

# Delete an attribute
{:ok, result} = Tomba.LeadsAttributes.delete_attribute(client, "attr_id")
```

### Bulk Operations

Create and manage bulk processing jobs for domain search, email finder, verifier, and more.

```elixir
# List bulk operations
{:ok, result} = Tomba.Bulk.list(client, "domain-search", %{})

# Get a specific bulk operation
{:ok, result} = Tomba.Bulk.get(client, "domain-search", "bulk_id")

# Create a bulk operation
{:ok, result} = Tomba.Bulk.create(client, "domain-search", %{
  "domains" => ["example.com"]
})

# Launch a bulk operation
{:ok, result} = Tomba.Bulk.launch(client, "domain-search", "bulk_id")

# Get progress
{:ok, result} = Tomba.Bulk.progress(client, "domain-search", "bulk_id")

# Download results
{:ok, result} = Tomba.Bulk.download(client, "domain-search", "bulk_id")

# Rename a bulk operation
{:ok, result} = Tomba.Bulk.rename(client, "domain-search", "bulk_id", "New Name")

# Archive a bulk operation
{:ok, result} = Tomba.Bulk.archive(client, "domain-search", "bulk_id")

# Delete a bulk operation
{:ok, result} = Tomba.Bulk.delete(client, "domain-search", "bulk_id")
```

Supported bulk types: `domain-search`, `email-finder`, `author-finder`, `email-verifier`, `enrichment`, `linkedin-finder`, `phone-finder`, `department-search`, `technology-search`, `name-finder`.

## Testing

```bash
mix test
```

To run the linter:

```bash
mix lint
```

## Documentation

- [Official API Documentation](https://docs.tomba.io/)
- [Hex Docs](https://hexdocs.pm/tomba)
- [API Reference](https://docs.tomba.io/api)
- [All Client Libraries](https://docs.tomba.io/libraries)

## About Tomba

Founded to solve the problem of unreliable email data, [Tomba.io](https://tomba.io) is the leading B2B email intelligence platform.

### Products

- **[Email Finder](https://tomba.io/email-finder)** — Find any professional email address
- **[Email Verifier](https://tomba.io/email-verifier)** — Verify emails in real-time
- **[Domain Search](https://tomba.io/domain-search)** — Find all emails for a company
- **[Phone Finder](https://tomba.io/phone-finder)** — Find direct phone numbers
- **[Bulk Enrichment](https://tomba.io/bulks)** — Enrich contacts at scale
- **[AI Company Search](https://tomba.io/reveal)** — Find companies with AI-powered search
- **[CLI](https://tomba.io/cli)** — Command-line interface for Tomba
- **[MCP Server](https://tomba.io/mcp)** — Connect AI tools (Claude, ChatGPT, Cursor) to Tomba
- **[REST API](https://tomba.io/api)** — Full programmatic access

### Browser Extensions & Add-ons

- **[Chrome Extension](https://chromewebstore.google.com/detail/tomba-email-finder-email/icmjegjggphchjckknoooajmklibccjb)** — Find emails while browsing
- **[Google Sheets Add-on](https://tomba.io/sheets)** — Enrich leads in spreadsheets
- **[Microsoft Excel Add-in](https://tomba.io/excel)** — Email finder in Excel
- **[Airtable Integration](https://tomba.io/airtable)** — Connect with Airtable

### Integrations

50+ CRM integrations: [Salesforce](https://tomba.io/integrations) · [HubSpot](https://tomba.io/integrations) · [Zapier](https://tomba.io/integrations) · [Pipedrive](https://tomba.io/integrations) · [and more...](https://tomba.io/integrations)

### Other Tomba SDKs

| Language | Package                                                     |
| -------- | ----------------------------------------------------------- |
| Node.js  | [tomba](https://www.npmjs.com/package/tomba)                |
| Python   | [tomba-io](https://pypi.org/project/tomba-io/)              |
| PHP      | [tomba-io/php](https://packagist.org/packages/tomba-io/php) |
| Ruby     | [tomba](https://rubygems.org/gems/tomba)                    |
| Go       | [tomba-io/go](https://pkg.go.dev/github.com/tomba-io/go)    |
| Rust     | [tomba](https://crates.io/crates/tomba)                     |
| Dart     | [tomba](https://pub.dev/packages/tomba)                     |
| Deno     | [@tomba/sdk](https://jsr.io/@tomba/sdk)                     |
| Elixir   | [tomba](https://hex.pm/packages/tomba)                      |
| C#       | [Tomba](https://www.nuget.org/packages/Tomba)               |
| Perl     | [Tomba::Client](https://metacpan.org/pod/Tomba::Client)     |
| Lua      | [tomba](https://luarocks.org/modules/tomba/tomba)           |
| R        | [tomba](https://github.com/tomba-io/r)                      |

### Resources

- [Blog](https://tomba.io/blog) · [Help Center](https://help.tomba.io) · [API Docs](https://docs.tomba.io) · [Pricing](https://tomba.io/pricing) · [Status](https://status.tomba.io)

---

**[Try Tomba Free](https://app.tomba.io/auth/register)** — Find your first email in seconds. No credit card required.

## License

Apache 2.0 -- see [LICENSE](http://www.apache.org/licenses/LICENSE-2.0.html) for details.
