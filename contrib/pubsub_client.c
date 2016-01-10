#include <assert.h>
#include <string.h>
#include <stdio.h>
#include <nanomsg/nn.h>
#include <nanomsg/pubsub.h>

int client (const char *url, const char *name)
{
  int sock = nn_socket (AF_SP, NN_SUB);
  assert (sock >= 0);
  // TODO learn more about publishing/subscribe keys
  assert (nn_setsockopt (sock, NN_SUB, NN_SUB_SUBSCRIBE, "", 0) >= 0);
  assert (nn_connect (sock, url) >= 0);
  while (1)
    {
      char *buf = NULL;
      int bytes = nn_recv (sock, &buf, NN_MSG, 0);
      assert (bytes >= 0);
      printf ("CLIENT (%s): RECEIVED %s\n", name, buf);
      nn_freemsg (buf);
    }
  return nn_shutdown (sock, 0);
}

int main (const int argc, const char **argv)
{
   return client ("tcp://127.0.0.1:5018", argv[1]);
}
