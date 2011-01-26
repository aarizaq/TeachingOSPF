
package inet.examples.ospfv2.artDocencia;

import inet.linklayer.ethernet.EtherHub;
import inet.nodes.inet.OSPFRouter;
import inet.nodes.inet.StandardHost;
import inet.world.ChannelInstaller;
import ned.DatarateChannel;


network SimpleTest
{
    parameters:
        @display("p=10,10;b=712,152");
    types:
        channel C extends DatarateChannel
        {
            delay = 0.1us;
        }
    submodules:
        channelInstaller: ChannelInstaller {
            parameters:
                channelClass = "ThruputMeteringChannel";
                channelAttrs = "format=#N";
                @display("p=130,40");
        }
        H1: StandardHost {
            parameters:
                @display("p=56,92;i=device/laptop");
            gates:
                ethg[1];
        }
        N1: EtherHub {
            parameters:
                @display("p=184,92");
            gates:
                ethg[2];
        }
        R1: OSPFRouter {
            parameters:
                @display("p=269,92");
            gates:
                ethg[1];
                pppg[2];
        }
        R2: OSPFRouter {
            parameters:
                @display("p=464,107");
            gates:
                ethg[1];
                pppg[2];
        }
        N2: EtherHub {
            parameters:
                @display("p=532,92");
            gates:
                ethg[2];
        }
        H2: StandardHost {
            parameters:
                @display("p=660,92;i=device/laptop");
            gates:
                ethg[1];
        }
        R3: OSPFRouter {
            parameters:
                @display("p=337,59");
            gates:
                pppg[3];
        }
        R4: OSPFRouter {
            parameters:
                @display("p=337,155");
            gates:
                pppg[3];
        }
        R5: OSPFRouter {
            parameters:
                @display("p=405,155");
            gates:
                pppg[3];
        }
        R6: OSPFRouter {
            parameters:
                @display("p=405,60");
            gates:
                pppg[3];
        }
    connections:
        H1.ethg[0] <--> C <--> N1.ethg[0];
        N1.ethg[1] <--> C <--> R1.ethg[0];
        R2.ethg[0] <--> C <--> N2.ethg[0];
        N2.ethg[1] <--> C <--> H2.ethg[0];

        R1.pppg[0] <--> C <--> R3.pppg[0];
        R1.pppg[1] <--> C <--> R4.pppg[0];
        R2.pppg[0] <--> C <--> R5.pppg[0];
        R2.pppg[1] <--> C <--> R6.pppg[0];
        R3.pppg[1] <--> C <--> R4.pppg[1];
        R4.pppg[2] <--> C <--> R5.pppg[1];
        R3.pppg[2] <--> C <--> R6.pppg[1];
        R5.pppg[2] <--> C <--> R6.pppg[2];


}

