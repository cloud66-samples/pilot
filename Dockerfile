# BuildGrid isolation test: another account's (otter) image, named by the registry's address and pinned by digest, must fail with "denied by policy"
FROM 134.122.99.191/staging/otter/csv2-pilot.prod.github-com-cloud66-samples-pilot@sha256:c081c13f45fed4de8a73b0f89c59583aa21bfa8fe47f1756f0e969c1e5071bda
