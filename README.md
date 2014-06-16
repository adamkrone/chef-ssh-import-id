# ssh-import-id

Install ssh-import-id and adds keys for the specified accounts.
Currently only has Github support.

##Import Attributes

Below is an example configuration:

```ruby
{
  :ssh_import_id => {
    :users => [
      {
        :name => 'vagrant',
        :github_accounts => [
          'adamkrone',
          'einsty'
        ]
      },
      {
        :name => 'root',
        :github_accounts => [
          'adamkrone'
        ]
      }
    ]
  }
}
```

Users takes an array of hashes that include a name and an array of Github account usernames.
